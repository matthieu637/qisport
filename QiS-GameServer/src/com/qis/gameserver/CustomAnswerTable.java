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

import java.util.ArrayList;
import java.util.Hashtable;

import com.peanuts.database.DatabaseMemoryManager;
import com.qis.commons.Sport;
import com.qis.gameserver.dao.object.CustomAnswer;

/**
 * @author Matthieu637
 * 
 */
public class CustomAnswerTable {
	private Hashtable<Sport, ArrayList<CustomAnswer>>	good	= new Hashtable<Sport, ArrayList<CustomAnswer>>();
	private Hashtable<Sport, ArrayList<CustomAnswer>>	wrong	= new Hashtable<Sport, ArrayList<CustomAnswer>>();

	public CustomAnswerTable() {
		createTableFromDatabase();
	}

	public Hashtable<Sport, ArrayList<CustomAnswer>> getTable(boolean good) {
		return good ? this.good : wrong;
	}

	private void createTableFromDatabase() {
		DatabaseMemoryManager<CustomAnswer> customAnswerMemory = new DatabaseMemoryManager<CustomAnswer>(QiSGameServer.dao.getCustomAnswerDAO(), 24 * 3600);

		for (Sport s : Sport.values())
			good.put(s, getArrayBySportGood(customAnswerMemory.getTab(), s, true));

		for (Sport s : Sport.values())
			wrong.put(s, getArrayBySportGood(customAnswerMemory.getTab(), s, false));

	}

	private ArrayList<CustomAnswer> getArrayBySportGood(ArrayList<CustomAnswer> a, Sport s, boolean g) {
		ArrayList<CustomAnswer> result = new ArrayList<CustomAnswer>(a.size() / 6);

		for (CustomAnswer i : a)
			if (i.getSport() == s && i.isGood() == g) {
				result.add(i);
			}

		return result;
	}

	public synchronized void reload() {
		good.clear();
		wrong.clear();

		createTableFromDatabase();
	}
}
