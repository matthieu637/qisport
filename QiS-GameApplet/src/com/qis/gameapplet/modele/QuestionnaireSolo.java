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

package com.qis.gameapplet.modele;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Timer;

import com.peanuts.server.packets.Packets;
import com.qis.commons.Points;
import com.qis.commons.packets.AnswerPacket;
import com.qis.commons.packets.AskJokerPacket;
import com.qis.commons.packets.FinishPacket;
import com.qis.commons.packets.GameTypePacket;
import com.qis.commons.packets.JokerPacket;
import com.qis.commons.packets.NextPacket;
import com.qis.commons.packets.PassPacket;
import com.qis.commons.packets.QuestionPacket;
import com.qis.commons.packets.ScorePacket;
import com.qis.commons.packets.SessionPHPPacket;
import com.qis.commons.packets.SportPacket;
import com.qis.commons.packets.WrongAnswer;
import com.qis.gameapplet.Config;

public class QuestionnaireSolo extends AbstractQuestionnaire implements ActionListener {

	private Timer	timer;
	private int		temps;
	private boolean	joker;

	public QuestionnaireSolo(Config config) {
		super(config);
		timer = new Timer(25, this);
		joker = true;
	}

	@Override
	public boolean timerRunning() {
		return timer.isRunning();
	}

	public void start() {
		connexion.sendPackets(new SessionPHPPacket(config.phpSessionID));
		connexion.sendPackets(new SportPacket(config.sport));
		connexion.sendPackets(new GameTypePacket(config.gametype));

		prevenirVuesDebut();

		if (!connexionValide())
			prevenirVuesErreur(null);
	}

	@Override
	public void receivePacket(Packets packet) {

		if (packet instanceof QuestionPacket) {
			temps = 12 * 1000;
			timer.start();
			prevenirVuesQuestion((String) packet.getAgrs().get(0), (String) packet.getAgrs().get(1));
		} else if (packet instanceof WrongAnswer) {
			prevenirMauvaiseReponse();
		} else if (packet instanceof JokerPacket) {
			prevenirJoker((String) packet.getAgrs().get(0));
		} else if (packet instanceof ScorePacket) {
			timer.stop();
			prevenirNombrePoint((Integer) packet.getAgrs().get(0));
			prevenirNouveauCommentaire((String) packet.getAgrs().get(2), (Boolean) packet.getAgrs().get(1));
		} else if (packet instanceof FinishPacket) {

			byte[] points = new byte[5];

			for (int i = 0; i < points.length; i++)
				points[i] = (Byte) (packet.getAgrs().get(i));

			prevenirFin(points, joker);

			connexion.close();
		}

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		prevenirTockHorloge();
	}

	public void prevenirTockHorloge() {
		temps -= 25;

		if (temps <= 0) {
			timer.stop();

			connexion.sendPackets(new PassPacket());
			prevenirPointsRestant(Points.getPointsPerMiliSecond(12 * 1000 - temps));
			prevenirStopReponse();
		}

		if (temps % 100 == 0)
			prevenirPointsRestant(Points.getPointsPerMiliSecond(12 * 1000 - temps));
		prevenirTempsRestant(temps);
	}

	@Override
	public void ok(String reponse) {
		long temps_espere = 12 * 1000 - temps;
		connexion.sendPackets(new AnswerPacket(reponse, temps_espere));
	}

	@Override
	public void passer() {
		connexion.sendPackets(new PassPacket());
		timer.stop();
	}

	@Override
	public void suivant() {
		connexion.sendPackets(new NextPacket());
	}

	@Override
	public void joker() {
		joker = false;
		connexion.sendPackets(new AskJokerPacket());
	}
}