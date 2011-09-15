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

package com.qis.gameserver;

import java.io.File;

import com.peanuts.config.ConfigurationFactory;
import com.peanuts.config.Property;
import com.peanuts.utils.ArraysMethod;
import com.qis.commons.Gametype;

/**
 * @author Matthieu637
 * 
 */
public class QiSConfig {
	private static boolean	load	= false;

	@Property(key = "QiS.main.port", defaultValue = "37365")
	public static int		MAIN_PORT;

	@Property(key = "QiS.session.path", defaultValue = "C:/Programs/wamp/tmp/")
	public static String	SESSIONS_PATH;

	@Property(key = "Qis.gametype.register", defaultValue = "001,002")
	public static String[]	GAMETYPE_REGISTER;

	@Property(key = "QiS.memory.questionnaire", defaultValue = "true")
	public static boolean	ACTIVE_CACHE_MEMORY_QUESTIONNAIRE;

	@Property(key = "QiS.session.path.prefix", defaultValue = "sess_")
	public static String	SESSIONS_PATH_PREFIX;

	@Property(key = "debug", defaultValue = "false")
	public static boolean	DEBUG;

	@Property(key = "register_score", defaultValue = "true")
	public static boolean	REGISTER_SCORE;

	public static void load() {
		if (!load) {
			ConfigurationFactory.build(QiSConfig.class, "config" + File.separator + "config.properties");
			load = true;
			checkGametype();
		}
	}

	public static void checkGametype() {
		for (int i = 0; i < GAMETYPE_REGISTER.length; i++)
			if (!ArraysMethod.contains(Gametype.values(), Gametype.createGametype(GAMETYPE_REGISTER[i])))
				throw new Error("Gametype unknown :" + GAMETYPE_REGISTER[i]);
	}
}
