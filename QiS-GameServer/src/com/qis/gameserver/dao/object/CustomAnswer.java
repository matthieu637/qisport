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

import com.peanuts.database.dao.object.DatabaseMemoryCached;
import com.qis.commons.Sport;

/**
 * @author Matthieu637
 *
 */
public class CustomAnswer implements DatabaseMemoryCached, Comparable<CustomAnswer>
{
	private final int id;
	private final String answer;
	private final boolean good;
	private final Sport sport;
	/**
	 * @return the id
	 */
	public int getId()
	{
		return id;
	}
	/**
	 * @param id
	 * @param answer
	 * @param good
	 * @param sport
	 */
	public CustomAnswer(int id, String answer, boolean good, Sport sport)
	{
		this.id = id;
		this.answer = answer;
		this.good = good;
		this.sport = sport;
	}
	/**
	 * @return the answer
	 */
	public String getAnswer()
	{
		return answer;
	}
	/**
	 * @return the good
	 */
	public boolean isGood()
	{
		return good;
	}
	/**
	 * @return the sport
	 */
	public Sport getSport()
	{
		return sport;
	}
	/* (non-Javadoc)
	 * @see com.qis.gameserver.getIDPossible#getID()
	 */
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		return "CustomAnswer [ good=" + good + ", id=" + id + ", sport=" + sport + "]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(CustomAnswer o)
	{
		Boolean g = good;
		return sport.compareTo(o.sport)*10 + g.compareTo(o.good);
	}
	
}
