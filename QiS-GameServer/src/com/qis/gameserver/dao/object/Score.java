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

package com.qis.gameserver.dao.object;

public class Score {
	private int				id;
	private final int		id_account;
	private final int		id_questionnaire;
	private final int		score;
	private final long		start_time;
	private final long		finish_time;
	private final byte[]	score_details;
	private final ScoreMode	mode;

	public Score(int id, int idAccount, int id_questionnaire, int score, long startTime, long finishTime, byte[] scoreDetails, ScoreMode mode) {
		id_account = idAccount;
		this.score = score;
		start_time = startTime;
		finish_time = finishTime;
		score_details = scoreDetails;
		this.id_questionnaire = id_questionnaire;
		this.mode = mode;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public int getId_account() {
		return id_account;
	}

	public int getScore() {
		return score;
	}

	public long getStart_time() {
		return start_time;
	}

	public long getFinish_time() {
		return finish_time;
	}

	public byte[] getScore_details() {
		return score_details;
	}

	public int getId_questionnaire() {
		return id_questionnaire;
	}

	public ScoreMode getMode() {
		return mode;
	}
}
