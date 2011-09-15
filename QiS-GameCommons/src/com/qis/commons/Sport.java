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

package com.qis.commons;

import java.util.Calendar;

public enum Sport {
	BasketBall("Basket-Ball"), Cyclisme("Cyclisme"), Football("Football"), Rugby("Rugby"), SportsHiver("Sports d'Hiver"), Tennis("Tennis");

	private String	id;

	private Sport(String t) {
		id = t;
	}

	public static Sport getInstance(String s) {
		for (int i = 0; i < Sport.values().length; i++)
			if (Sport.values()[i].id.equals(s))
				return Sport.values()[i];
		return null;
	}

	public static boolean valideDaySport(String sport) {
		Sport s = getInstance(sport);

		if (s == null)
			return false;

		return s.isValideDay();
	}

	public boolean isValideDay() {
		Calendar c = Calendar.getInstance();
		int day = c.get(Calendar.DAY_OF_WEEK);

		// TODO:sunday
		if (day == Calendar.SUNDAY)
			return true;

		if (this == BasketBall || this == Rugby)
			return day == Calendar.MONDAY || day == Calendar.TUESDAY;
		else if (this == Cyclisme || this == Football)
			return day == Calendar.WEDNESDAY || day == Calendar.THURSDAY;
		else if (this == SportsHiver || this == Tennis)
			return day == Calendar.FRIDAY || day == Calendar.SATURDAY;

		return false;
	}

	public String toString() {
		return id;
	}
}
