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

package com.qis.gameapplet;

import java.awt.Color;
import java.awt.Font;

import javax.swing.JApplet;

import com.qis.commons.Gametype;
import com.qis.commons.Sport;

public class Config {

	private static final boolean	DEBUG			= true;
	public static final Color		QiSRed			= new Color(193, 10, 10);
	public final static Font		font			= new Font("Comic Sans MS", Font.PLAIN, 16);
	public final static Font		font_20			= new Font("Comic Sans MS", Font.PLAIN, 20);
	public final static Font		font_24			= new Font("Comic Sans MS", Font.PLAIN, 24);
	public final static Font		font_bold		= new Font("Comic Sans MS", Font.BOLD, 16);
	public final static Font		font_bold_32	= new Font("Comic Sans MS", Font.BOLD, 32);

	public String					phpSessionID	= null;
	public String					host			= null;
	public int						port			= -1;
	public Gametype					gametype		= null;
	public Sport					sport			= null;

	public static boolean			antialiasing	= true;

	public Config(JApplet applet) {
		if (checkConfig(applet.getParameter("GAMETYPE") != null, "Aucun GAMETYPE")
				&& checkConfig(Gametype.createGametype(applet.getParameter("GAMETYPE")) != null, "GAMETYPE invalide")) {
			gametype = Gametype.createGametype(applet.getParameter("GAMETYPE"));
		} else
			return;

		if (checkConfig(applet.getParameter("PHPSESSID") != null, "Aucune session lance")
				&& checkConfig(applet.getParameter("PHPSESSID").length() == 26, "Format session invalide")
				&& checkConfig(applet.getParameter("HOST") != null, "Aucun host") && checkConfig(applet.getParameter("PORT") != null, "Aucun port")) {
			{
				phpSessionID = applet.getParameter("PHPSESSID");
				host = applet.getParameter("HOST");
				port = Integer.parseInt(applet.getParameter("PORT"));
			}
		} else
			return;

		switch (gametype) {
			case defis:
			case semaine:
				if (checkConfig(applet.getParameter("SPORT") != null, "Sport vide")
						&& checkConfig(Sport.valideDaySport(applet.getParameter("SPORT")), "Sport invalide")) {
					sport = Sport.getInstance(applet.getParameter("SPORT"));
					break;
				}
			default:
				gametype = null;
		}
	}

	public boolean estValide() {
		return phpSessionID != null && host != null && port != -1 && gametype != null && sport != null;
	}

	private boolean checkConfig(boolean check, final String commentaire) {
		if (!check) {
			if (DEBUG)
				System.out.println(commentaire);
			return false;
		}

		return true;
	}
}
