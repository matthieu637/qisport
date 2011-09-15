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
package com.qis.gameserver.dao.object;

import com.qis.commons.Sport;

/**
 * @author Matthieu637
 * 
 */
public class Question {
	private final int		id;
	private final int		id_questionnaire;
	private final String	question;
	private final String	uncrypt_answer;
	private final String	crypt_answer;
	private final Sport		sport;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	public Question(int id, int idQuestionnaire, String question, String answer, Sport sport) {
		super();
		this.id = id;
		id_questionnaire = idQuestionnaire;
		this.question = question;
		this.uncrypt_answer = answer;
		this.sport = sport;

		crypt_answer = crypt(answer);
	}

	private String crypt(String answer) {
		StringBuffer result = new StringBuffer(answer.length());

		for (int i = 0; i < answer.length(); i++)
			if (answer.charAt(i) == ' ')
				result.append(' ');
			else if (Character.isLetterOrDigit(answer.charAt(i)))
				result.append('_');
			else
				result.append(answer.charAt(i));

		return new String(result);
	}

	public boolean rightAnswer(String test) {
		return this.uncrypt_answer.equalsIgnoreCase(test);
	}

	public int getId_questionnaire() {
		return id_questionnaire;
	}

	public Sport getSport() {
		return sport;
	}

	/**
	 * @return
	 */
	public String getQuestion() {
		return question;
	}

	/**
	 * @return
	 */
	public String getUncryptAnswer() {
		return uncrypt_answer;
	}

	public String getCryptAnswer() {
		return crypt_answer;
	}
}
