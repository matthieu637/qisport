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

/**
 * 
 */
package com.qis.gameserver;

import java.net.Socket;
import java.util.ArrayList;
import java.util.Calendar;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.peanuts.server.IOClientConnection;
import com.peanuts.server.packets.ClosePackets;
import com.peanuts.server.packets.Packets;
import com.peanuts.utils.ArraysMethod;
import com.peanuts.utils.Randoms;
import com.qis.commons.Gametype;
import com.qis.commons.Sport;
import com.qis.commons.packets.AnswerPacket;
import com.qis.commons.packets.AskJokerPacket;
import com.qis.commons.packets.FinishPacket;
import com.qis.commons.packets.GameTypePacket;
import com.qis.commons.packets.JokerPacket;
import com.qis.commons.packets.NextPacket;
import com.qis.commons.packets.PassPacket;
import com.qis.commons.packets.QiSErrorsPackets;
import com.qis.commons.packets.QuestionPacket;
import com.qis.commons.packets.ScorePacket;
import com.qis.commons.packets.SessionPHPPacket;
import com.qis.commons.packets.SportPacket;
import com.qis.commons.packets.WrongAnswer;
import com.qis.gameserver.dao.object.Account;
import com.qis.gameserver.dao.object.CustomAnswer;
import com.qis.gameserver.dao.object.DefisDimanche;
import com.qis.gameserver.dao.object.Programs;
import com.qis.gameserver.dao.object.Questionnaire;

/**
 * @author Matthieu637
 * 
 */
public class QiSClientConnection extends IOClientConnection {

	private static final Logger		log				= Logger.getLogger(QiSClientConnection.class);

	private String					PHPSessionID	= null;
	private Account					account			= null;
	private Gametype				gametype		= null;
	private Sport					sport			= null;
	private QuestionnaireInstance	instance;

	private QiSIOServer				parrent;

	/**
	 * @param parrent
	 * @param s
	 */

	public QiSClientConnection(QiSIOServer parrent, Socket s, boolean b) {
		super(parrent, s, b, QiSConfig.DEBUG);
		this.parrent = parrent;

		log.setLevel(QiSConfig.DEBUG ? Level.DEBUG : Level.INFO);
	}

	@Override
	protected void receiveRegisterPacket(Packets inPackets) {

		if (inPackets instanceof AnswerPacket) {
			long time = System.currentTimeMillis();

			if (instance != null && instance.started() && (String) inPackets.getAgrs().get(0) != null && (Long) inPackets.getAgrs().get(1) != null) {

				if (instance.acceptable_time(time, (Long) inPackets.getAgrs().get(1))) {
					instance.answerWithAcceptableTime((String) inPackets.getAgrs().get(0), (Long) inPackets.getAgrs().get(1));
				} else
					instance.answer((String) inPackets.getAgrs().get(0), time);

				if (instance.change()) {
					ArrayList<CustomAnswer> e = QiSGameServer.customAnswerMemory.getTable(instance.answerWasGood()).get(sport);

					sendPacket(new ScorePacket(instance.getScore(), instance.answerWasGood(), e.get(Randoms.ramdom(0, e.size())).getAnswer()));
				} else
					sendPacket(new WrongAnswer());
			}
		} else if (inPackets instanceof AskJokerPacket) {
			if (instance != null && instance.started() && instance.haveJoker()) {
				sendPacket(new JokerPacket(instance.joker()));
			}
		} else if (inPackets instanceof PassPacket) {
			if (instance != null && instance.started()) {
				instance.pass();

				ArrayList<CustomAnswer> e = QiSGameServer.customAnswerMemory.getTable(instance.answerWasGood()).get(sport);

				sendPacket(new ScorePacket(instance.getScore(), instance.answerWasGood(), e.get(Randoms.ramdom(0, e.size())).getAnswer()));
			}
		} else if (inPackets instanceof NextPacket) {
			if (instance != null && instance.started()) {
				if (instance.questionnaireEmpty()) {
					instance.finish(account.getId());

					sendPacket(new FinishPacket(instance.getDetailsScore()));
					close();
				} else {
					instance.start();
					log.debug(instance.getQuestion().getUncryptAnswer());
					sendPacket(new QuestionPacket(instance.getQuestion().getQuestion(), instance.getQuestion().getCryptAnswer()));
				}
			}
		} else if (inPackets instanceof GameTypePacket) {
			if (inPackets.getAgrs().get(0) instanceof Gametype
					&& ArraysMethod.contains(QiSConfig.GAMETYPE_REGISTER, ((Gametype) inPackets.getAgrs().get(0)).getID()) && gametype == null) {

				gametype = (Gametype) inPackets.getAgrs().get(0);

				int day = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
				switch (gametype) {
					case semaine:
						if (day != Calendar.SUNDAY) {
							try_start_Questionnaire(false);
						} else {
							sendPacket(new QiSErrorsPackets(QiSErrorsPackets.ONLY_DEFIS_AVAIBLE_TODAY, true));
							close();
						}
						break;
					case defis:
						if (day == Calendar.SUNDAY)
							try_start_Questionnaire(true);
						else {
							sendPacket(new QiSErrorsPackets(QiSErrorsPackets.DEFIS_NOT_AVAIBLE_TODAY, true));
							close();
						}
					default:
						gametype = null;
				}
			}
		} else if (inPackets instanceof SportPacket) {
			if (inPackets.getAgrs().get(0) instanceof Sport && (Sport) inPackets.getAgrs().get(0) != null && sport == null) {
				sport = (Sport) inPackets.getAgrs().get(0);

				if (!sport.isValideDay()) {
					sport = null;
					sendPacket(new QiSErrorsPackets(QiSErrorsPackets.SPORT_NOT_AVAILABLE_TODAY));
					close();
				}
			}
		} else if (inPackets instanceof SessionPHPPacket) {
			if (inPackets.getAgrs().get(0) instanceof String && account == null && PHPSessionID == null) {
				if (Sessions.validSession((String) inPackets.getAgrs().get(0))) {
					PHPSessionID = (String) inPackets.getAgrs().get(0);

					account = new Account(Sessions.getIdAccount(PHPSessionID));

					if (account.getId() == -1)
						close();

					if (parrent.unique(account))
						parrent.add(account);
					else {
						account = null;
						sendPacket(new QiSErrorsPackets(QiSErrorsPackets.ACCOUNT_ALREADY_CONNECTED));
						close();
					}
				} else {
					// TODO: brute force block
					log.error("Someone try to connect with a wrong session. IP : " + this.getInetAddress() + " Session : "
							+ (String) inPackets.getAgrs().get(0));
					sendPacket(new ClosePackets());
					close();
				}
			}
		} else if (inPackets instanceof ClosePackets) {
			this.close();
		}

	}

	private synchronized void try_start_Questionnaire(boolean defis) {
		log.debug("try start Questionnaire");
		if (sport != null && gametype != null && account != null) {
			Questionnaire q = null;
			DefisDimanche def = null;

			if (defis) {
				if (QiSGameServer.dao.getScoreDAO().specialFind(new String[] { "alreadyPlayDefisDimanche", String.valueOf(account.getId()) }) != null) {
					sendPacket(new QiSErrorsPackets(QiSErrorsPackets.ALREADY_PLAY_DEFIS_DIMANCHE));
					close();
					return;
				}

				def = QiSGameServer.dao.getDefisDimancheDAO().specialFind(new String[] { String.valueOf(account.getId()), sport.toString() });

				if (def == null)
					q = QiSGameServer.dao.getQuestionnaireDAO().specialFind(new String[] { "randomBySport", sport.toString() });
				else
					q = QiSGameServer.dao.getQuestionnaireDAO().find(def.getId_questionnaire());
			} else { // normal
				Programs p = QiSGameServer.dao.getProgramsDAO().specialFind(null);

				if (p == null) {
					sendPacket(new QiSErrorsPackets(QiSErrorsPackets.PROGRAMS_NOT_CREATE));
					close();
					return;
				}

				q = p.getQuestionnaireFromSport(sport);
			}

			if (q == null) {
				sendPacket(new QiSErrorsPackets(QiSErrorsPackets.QUESTIONNAIRE_NOT_CREATE));
				close();
				return;
			}

			if (defis ? true : QiSGameServer.dao.getScoreDAO().specialFind(new String[] { String.valueOf(account.getId()), String.valueOf(q.getId()) }) == null) {
				instance = new QuestionnaireInstance(q, defis, def);

				instance.start();

				log.debug(instance.getQuestion().getUncryptAnswer());
				sendPacket(new QuestionPacket(instance.getQuestion().getQuestion(), instance.getQuestion().getCryptAnswer()));

			} else {
				sendPacket(new QiSErrorsPackets(QiSErrorsPackets.ALREADY_PLAY));
				close();
			}

		}
	}

	protected void sendPacket(Packets p) {
		super.sendPacket(p);
	}

	@Override
	public void closeMore() {
		if (account != null)
			parrent.remove(account);

		if (instance != null && instance.started() && account != null)
			instance.finish(account.getId());
	}
}
