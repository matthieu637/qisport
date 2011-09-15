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
package com.peanuts.database;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.peanuts.database.dao.DAO;
import com.peanuts.database.dao.object.DatabaseMemoryCached;

/**
 * @author Matthieu637
 * 
 */
public class DatabaseMemoryManager<T extends DatabaseMemoryCached> extends Thread {
	private final static Logger	log	= Logger.getLogger(DatabaseMemoryManager.class);

	private DAO<T>				dao;
	private ArrayList<T>		tab	= new ArrayList<T>();
	private int					reload_time;

	public DatabaseMemoryManager(DAO<T> dao) {
		this.dao = dao;
		load();
	}

	public DatabaseMemoryManager(DAO<T> dao, int reload_time_sec) {
		this.dao = dao;
		this.reload_time = reload_time_sec;

		load();
		start();
	}

	public ArrayList<T> getTab() {
		return tab;
	}

	private void load() {
		log.fatal("Dont use cache.");
		// FIXME : ERROR ON 1
		int i = 1;

		T current;
		while ((current = dao.find(i)) != null) {
			tab.add(current);
			i++;
		}
	}

	public synchronized void reload() {
		tab.clear();
		load();
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(reload_time * 1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			reload();
		}
	}

	public T find(int i) {
		for (T c : tab)
			if (c.getId() == i)
				return c;

		return null;
	}
}
