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

import com.qis.commons.Sport;

public class DefisDimanche {

	private final int	id;
	private final int	id_account_1;
	private final int	id_questionnaire;
	private final Sport	sport;
	private int			id_account_2;
	private int			id_score;
	private int			id_winner;

	public DefisDimanche(int id, int id_account_1, int id_questionnaire, Sport sport, int id_score) {
		this.id = id;
		this.id_account_1 = id_account_1;
		this.id_questionnaire = id_questionnaire;
		this.sport = sport;
		this.id_score = id_score;
	}

	public int getID() {
		return id;
	}

	public int getId_account_2() {
		return id_account_2;
	}

	public void setId_account_2(int idAccount_2) {
		id_account_2 = idAccount_2;
	}

	public int getId() {
		return id;
	}

	public int getId_account_1() {
		return id_account_1;
	}

	public int getId_questionnaire() {
		return id_questionnaire;
	}

	public Sport getSport() {
		return sport;
	}

	public int getId_winner() {
		return id_winner;
	}

	public void setId_winner(int idWinner) {
		id_winner = idWinner;
	}

	public int getId_score() {
		return id_score;
	}

	public void setId_score(int idScore) {
		id_score = idScore;
	}
	
	

}
