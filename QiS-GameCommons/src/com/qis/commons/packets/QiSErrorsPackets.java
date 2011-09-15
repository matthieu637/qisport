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
package com.qis.commons.packets;

import com.peanuts.server.packets.ErrorsPackets;

/**
 * @author Matthieu637
 * 
 */
public class QiSErrorsPackets extends ErrorsPackets {
	private static final long	serialVersionUID			= 1L;

	public static final byte	ALREADY_PLAY				= 1;
	public static final byte	SPORT_NOT_AVAILABLE_TODAY	= 2;
	public static final byte	PROGRAMS_NOT_CREATE			= 3;
	public static final byte	ACCOUNT_ALREADY_CONNECTED	= 4;
	public static final byte	QUESTIONNAIRE_NOT_CREATE	= 5;
	public static final byte	DEFIS_NOT_AVAIBLE_TODAY		= 6;
	public static final byte	ONLY_DEFIS_AVAIBLE_TODAY	= 7;
	public static final byte	ALREADY_PLAY_DEFIS_DIMANCHE	= 8;

	public QiSErrorsPackets(byte i) {
		super(true, i);
	}

	public QiSErrorsPackets(byte i, boolean closeConnection) {
		super(closeConnection, i);
	}

	public String getError() {
		if (super.getError() != null)
			return super.getError();

		switch ((Byte) getAgrs().get(0)) {
			case ALREADY_CONNECTED:
				return "L'application a déjà été lancée.";
			case ALREADY_PLAY:
				return "Vous avez déjà répondu à ce questionnaire cette semaine.";
			case SPORT_NOT_AVAILABLE_TODAY:
				return "Ce sport est inaccessible aujourd'hui.";
			case PROGRAMS_NOT_CREATE:
				return "Le programme de cette semaine n'a pas encore était créé.\nVeuillez contacter les administrateurs.";
			case ACCOUNT_ALREADY_CONNECTED:
				return "Vous êtes déjà connecté.";
			case QUESTIONNAIRE_NOT_CREATE:
				return "Le questionnaire de cette semaine n'a pas encore était crée.\nVeuillez contacter les administrateurs.";
			case DEFIS_NOT_AVAIBLE_TODAY:
				return "Le défi n'est accessible que le dimanche.";
			case ONLY_DEFIS_AVAIBLE_TODAY:
				return "Le dimanche est réservé aux défis.";
			case ALREADY_PLAY_DEFIS_DIMANCHE:
				return "Vous avez déjà fait un défis ce dimanche.";
			default:
				return "Packet Message perdu";
		}
	}
}
