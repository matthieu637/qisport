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

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.qis.commons.Sport;
import com.qis.gameserver.QiSConfig;

public class Programs {
	private static final Logger	log		= Logger.getLogger(Programs.class);
	private static boolean		init	= false;

	private final int			id;
	private final String		week;
	private final Questionnaire	basketball;
	private final Questionnaire	cyclisme;
	private final Questionnaire	football;
	private final Questionnaire	rugby;
	private final Questionnaire	sportshiver;
	private final Questionnaire	tennis;

	public Programs(int id, String week, Questionnaire basketball, Questionnaire cyclisme, Questionnaire football, Questionnaire rugby,
			Questionnaire sportshiver, Questionnaire tennis) {

		if (!init) {
			init = true;
			log.setLevel(QiSConfig.DEBUG ? Level.DEBUG : Level.INFO);
		}

		this.id = id;
		this.week = week;
		this.basketball = basketball;
		this.cyclisme = cyclisme;
		this.football = football;
		this.rugby = rugby;
		this.sportshiver = sportshiver;
		this.tennis = tennis;

		log.debug("id :" + id + " week :" + week + " b : " + basketball + " c : " + cyclisme + " f : " + football + " r :" + rugby + " s :" + sportshiver
				+ " t :" + tennis);
	}

	public Questionnaire getQuestionnaireFromSport(Sport s) {
		if (s == Sport.BasketBall)
			return basketball;
		else if (s == Sport.Cyclisme)
			return cyclisme;
		else if (s == Sport.Football)
			return football;
		else if (s == Sport.Rugby)
			return rugby;
		else if (s == Sport.SportsHiver)
			return sportshiver;
		else if (s == Sport.Tennis)
			return tennis;

		throw new Error();
	}

	public int getId() {
		return id;
	}

	public String getWeek() {
		return week;
	}

	public Questionnaire getBasketball() {
		return basketball;
	}

	public Questionnaire getCyclisme() {
		return cyclisme;
	}

	public Questionnaire getFootball() {
		return football;
	}

	public Questionnaire getRugby() {
		return rugby;
	}

	public Questionnaire getSportshiver() {
		return sportshiver;
	}

	public Questionnaire getTennis() {
		return tennis;
	}
}
