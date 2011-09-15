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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;

import com.peanuts.utils.StringMethods;

/**
 * @author Matthieu637
 * 
 */
public class Sessions {
	private static final Logger	log					= Logger.getLogger(Sessions.class);
	private static final String	ACCOUNT_ACCESS		= "s:5:\"login\";s:";
	private static final String	ID_ACCOUNT_ACCESS	= "\"id\";i:";

	public static void checkSessionPath() {

		File f = new File(QiSConfig.SESSIONS_PATH);

		if (!f.exists() || !f.isDirectory() || !f.canRead()) {
			log.fatal("Wrong session path :" + QiSConfig.SESSIONS_PATH);
			throw new Error();
		}

	}

	public static boolean validSession(String session) {
		File f = new File(QiSConfig.SESSIONS_PATH + QiSConfig.SESSIONS_PATH_PREFIX + session);
		FileInputStream fi;
		BufferedReader buffer;
		int octet;
		String informations;

		try {
			fi = new FileInputStream(f);
			octet = fi.available();

			buffer = new BufferedReader(new BufferedReader(new InputStreamReader(fi)));
			informations = buffer.readLine();
		} catch (IOException e) {
			return false;
		}

		return f.exists() && f.canRead() && f.isFile() && octet > 0 && StringMethods.containsIgnoreCase(informations, ACCOUNT_ACCESS);
	}

	public static String getAccount(String session) {
		try {
			BufferedReader buffer = new BufferedReader(new BufferedReader(new InputStreamReader(new FileInputStream(QiSConfig.SESSIONS_PATH
					+ QiSConfig.SESSIONS_PATH_PREFIX + session))));

			String line = buffer.readLine();
			int start = line.indexOf(ACCOUNT_ACCESS) + ACCOUNT_ACCESS.length();
			String length = "";

			while (line.charAt(start) != ':') {
				length += line.charAt(start);
				start++;
			}

			return line.substring(start + 2, start + 2 + Integer.parseInt(length));
		} catch (IOException e) {
			log.error(e);
			return null;
		}
	}

	public static int getIdAccount(String session) {
		try {
			BufferedReader buffer = new BufferedReader(new BufferedReader(new InputStreamReader(new FileInputStream(QiSConfig.SESSIONS_PATH
					+ QiSConfig.SESSIONS_PATH_PREFIX + session))));

			String line = buffer.readLine();
			int start = line.indexOf(ID_ACCOUNT_ACCESS) + ID_ACCOUNT_ACCESS.length();
			String length = "";

			while (line.charAt(start) != ';') {
				length += line.charAt(start);
				start++;
			}

			int resultat = -1;

			try {
				resultat = Integer.parseInt(length);
			} catch (NumberFormatException e) {
				return -1;
			}

			return resultat;
		} catch (IOException e) {
			log.error(e);
			return -1;
		}
	}
}
