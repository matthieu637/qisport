/*
Copyright (c) 2011  <Matthieu Zimmer>

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/

package com.qis.gameserver;

import java.util.ArrayList;

import com.peanuts.utils.Randoms;
import com.peanuts.utils.StringMethods;
import com.qis.commons.Points;
import com.qis.gameserver.dao.object.DefisDimanche;
import com.qis.gameserver.dao.object.Question;
import com.qis.gameserver.dao.object.Questionnaire;
import com.qis.gameserver.dao.object.Score;
import com.qis.gameserver.dao.object.ScoreMode;

/**
 * @author Matthieu637
 * 
 */
public class QuestionnaireInstance {
	private static final int	MAX_PACKET_TRANSFERT_TIME	= 1500;
	private static final int	BONUS_WHEN_DONT_USE_JOKER	= 15;

	private final long			start_questionnaire;
	private long				start						= 0;
	private final Questionnaire	quest;
	private byte				current_question;
	private int					score						= 0;
	private boolean				change						= false;
	private boolean				goodAnswer					= false;
	private byte[]				score_details;
	private boolean				finish						= false;
	private boolean				have_joker					= true;
	private final boolean		defis;
	private DefisDimanche		defisDimanche;

	// TODO:random order
	public QuestionnaireInstance(Questionnaire quest, boolean defis, DefisDimanche defisDimanche) {
		start_questionnaire = System.currentTimeMillis();
		this.quest = quest;
		current_question = 0;
		score_details = new byte[5];
		this.defis = defis;
		this.defisDimanche = defisDimanche;
	}

	public Questionnaire getQuestionnaire() {
		return quest;
	}

	public boolean haveJoker() {
		return have_joker;
	}

	public Question getQuestion() {
		if (current_question < quest.getQuestions().length)
			return quest.getQuestions()[current_question];
		else
			return null;
	}

	private void next() {
		current_question++;
	}

	public boolean started() {
		return start != 0;
	}

	public void start() {
		start = System.currentTimeMillis();
	}

	public boolean acceptable_time(long current, long espair) {
		return espair - (current - start) <= MAX_PACKET_TRANSFERT_TIME;
	}

	private boolean valide_time(long time) {
		return time - start <= (MAX_PACKET_TRANSFERT_TIME * 12);
	}

	public String joker() {
		String ans_uncrypt = getQuestion().getUncryptAnswer();
		String ans_crypt = getQuestion().getCryptAnswer();

		// TODO:nombre à virgule arondi au supérieur
		int length = ans_uncrypt.length() / 3;

		ArrayList<Integer> without = new ArrayList<Integer>(ans_crypt.length());

		for (int i = 0; i < ans_crypt.length(); i++)
			if (ans_crypt.charAt(i) != '_')
				without.add(i);

		for (int i = 0; i < length; i++) {
			int p = Randoms.ramdomWithout(0, ans_uncrypt.length() - 1, without);
			without.add(p);

			byte[] n = ans_crypt.getBytes();
			n[p] = (byte) ans_uncrypt.charAt(p);
			ans_crypt = new String(n);
		}

		have_joker = false;
		return ans_crypt;
	}

	public void answer(String ans, long time) {
		if (valide_time(time) && goodAnswer(ans)) {
			score_details[current_question] = Points.getPointsPerMiliSecond((int) (time - start));
			score += score_details[current_question];

			goodAnswer = true;
			change = true;
		} else if (valide_time(time)) // answer false
		{
			goodAnswer = false;
			change = false;
		} else {
			goodAnswer = false;
			change = true;
		}

		if (change)
			next();
	}

	public void answerWithAcceptableTime(String ans, long time) {
		if (valide_time(time) && goodAnswer(ans)) {
			score_details[current_question] = Points.getPointsPerMiliSecond(time);
			score += score_details[current_question];
			goodAnswer = true;
			change = true;
		} else if (valide_time(time)) // answer false
		{
			goodAnswer = false;
			change = false;
		} else {
			goodAnswer = false;
			change = true;
		}

		if (change)
			next();
	}

	public void pass() {
		goodAnswer = false;
		change = true;

		next();
	}

	private boolean goodAnswer(String answer) {
		answer = StringMethods.removeSpecialChar(answer);
		answer = StringMethods.replaceAccent(answer);

		if (getQuestion() == null)
			return false;

		String right_ans = getQuestion().getUncryptAnswer();
		right_ans = StringMethods.removeSpecialChar(right_ans);
		right_ans = StringMethods.replaceAccent(right_ans);

		return answer.equalsIgnoreCase(right_ans);
	}

	public int getScore() {
		return score;
	}

	public byte[] getDetailsScore() {
		return score_details;
	}

	public boolean answerWasGood() {
		return goodAnswer;
	}

	public boolean questionnaireEmpty() {
		return current_question >= quest.getQuestions().length;
	}

	/**
	 * 
	 */
	public void finish(int idAccount) {
		if (!finish) {

			if (!QiSConfig.REGISTER_SCORE)
				System.out.println("Score not register");
			else {
				Score s = new Score(0, idAccount, quest.getId(), have_joker ? score + BONUS_WHEN_DONT_USE_JOKER : score, start_questionnaire, System
						.currentTimeMillis(), score_details, defis ? ScoreMode.DefisDimanche : ScoreMode.Normal);

				QiSGameServer.dao.getScoreDAO().create(s);

				if (defis) {
					if (defisDimanche == null) {
						DefisDimanche def = new DefisDimanche(0, idAccount, this.getQuestionnaire().getId(), this.getQuestionnaire().getSport(), s.getId());
						QiSGameServer.dao.getDefisDimancheDAO().create(def);
					} else {

						Score oposant = QiSGameServer.dao.getScoreDAO().specialFind(
								new String[] { "getScoreFromAccountAndQuestionnaire", String.valueOf(defisDimanche.getId_account_1()),
										String.valueOf(defisDimanche.getId_questionnaire()) });

						if (oposant.getScore() == score) {
							defisDimanche.setId_account_2(idAccount);
							defisDimanche.setId_score(-1);

							QiSGameServer.dao.getDefisDimancheDAO().update(defisDimanche);

							// création des 2 bonus de 50

							Score bonus = new Score(0, idAccount, this.getQuestionnaire().getId(), 50, start_questionnaire, System.currentTimeMillis(),
									new byte[] { 0, 0, 0, 0, 0 }, ScoreMode.BonusDefisDimanche);
							QiSGameServer.dao.getScoreDAO().create(bonus);

							bonus = new Score(0, oposant.getId_account(), this.getQuestionnaire().getId(), 50, start_questionnaire, System.currentTimeMillis(),
									new byte[] { 0, 0, 0, 0, 0 }, ScoreMode.BonusDefisDimanche);
							QiSGameServer.dao.getScoreDAO().create(bonus);
						} else {
							int id_gagnant = oposant.getScore() < score ? idAccount : oposant.getId_account();

							Score bonus = new Score(0, id_gagnant, this.getQuestionnaire().getId(), 100, start_questionnaire, System.currentTimeMillis(),
									new byte[] { 0, 0, 0, 0, 0 }, ScoreMode.BonusDefisDimanche);
							QiSGameServer.dao.getScoreDAO().create(bonus);

							defisDimanche.setId_account_2(idAccount);
							defisDimanche.setId_score(Math.max(bonus.getScore(), score));

							QiSGameServer.dao.getDefisDimancheDAO().update(defisDimanche);
						}
					}
				}
			}

			finish = true;
		}
	}

	public boolean change() {
		return change;
	}
}
