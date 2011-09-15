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

import java.security.AccessControlException;
import java.util.ArrayList;

import com.peanuts.client.ObserverConnection;
import com.peanuts.client.ServeurConnection;
import com.peanuts.server.packets.ErrorsPackets;
import com.qis.gameapplet.Config;
import com.qis.gameapplet.vue.Vue;

public abstract class AbstractQuestionnaire implements ObserverConnection {

	protected ServeurConnection	connexion;
	private boolean				connexionCorrect;
	protected ArrayList<Vue>	vues;
	protected Config			config;

	public AbstractQuestionnaire(Config config) {
		this.config = config;
		vues = new ArrayList<Vue>();

		try {
			connexion = new ServeurConnection(config.host, config.port);
			connexion.addObserver(this);

			connexionCorrect = connexion.connect();

		} catch (AccessControlException e) {
			connexionCorrect = false;
		}
	}

	public boolean connexionValide() {
		return connexionCorrect && connexion.connect();
	}

	@Override
	public void receiveError(ErrorsPackets p) {
		prevenirVuesErreur(p.getError());
	}

	public abstract void start();

	public abstract boolean timerRunning();

	public abstract void ok(String reponse);

	public abstract void passer();

	public abstract void suivant();

	public abstract void joker();

	/***************************************************************************
	 * **************************** OBSERVEUR ********************************
	 ****************************************************************************/

	public void ajouterVue(Vue e) {
		vues.add(e);
	}

	public void retirerVue(Vue e) {
		vues.remove(e);
	}

	public void retirerToutesVues() {
		vues.clear();
	}

	public void prevenirVuesDebut() {
		int size = vues.size();

		for (int i = 0; i < size; i++)
			vues.get(i).debut();
	}

	public void prevenirVuesQuestion(String question, String reponse) {
		for (Vue e : vues)
			e.nouvelleQuestion(question, reponse);
	}

	public void prevenirVuesErreur(String erreur) {
		for (Vue e : vues)
			e.nouvelleErreur(erreur);
	}

	public void prevenirNombrePoint(int points) {
		for (Vue e : vues)
			e.nouveauNombreDePoints(points);
	}

	public void prevenirPointsRestant(int points) {
		for (Vue e : vues)
			e.nouveauNombrePointsRestant(points);
	}

	public void prevenirTempsRestant(int temps) {
		for (Vue e : vues)
			e.nouveauTempsRestant(temps);
	}

	public void prevenirStopReponse() {
		for (Vue e : vues)
			e.stopReponse();
	}

	public void prevenirMauvaiseReponse() {
		for (Vue e : vues)
			e.mauvaiseReponse();
	}

	public void prevenirNouveauCommentaire(String commentaire, boolean positif) {
		for (Vue e : vues)
			e.nouveauCommentaire(commentaire, positif);
	}

	public void prevenirJoker(String joker) {
		for (Vue e : vues)
			e.joker(joker);
	}

	public void prevenirFin(byte[] points, boolean joker) {
		for (Vue e : vues)
			e.fin(points, joker);
	}
}