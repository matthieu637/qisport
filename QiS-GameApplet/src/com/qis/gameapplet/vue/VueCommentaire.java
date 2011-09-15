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

package com.qis.gameapplet.vue;

import java.awt.BorderLayout;
import java.awt.Color;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import com.qis.gameapplet.Config;

@SuppressWarnings("serial")
public class VueCommentaire extends JPanel implements Vue {

	private JLabel	commentaire;

	public VueCommentaire() {
		super(new BorderLayout());
		setBackground(Color.white);

		commentaire = new JLabel("  ", SwingConstants.CENTER);
		commentaire.setFont(Config.font);
		this.add(commentaire, BorderLayout.CENTER);
	}

	@Override
	public void nouveauCommentaire(String commentaire, boolean positif) {
		this.commentaire.setForeground(positif ? Color.green : Config.QiSRed);
		this.commentaire.setText("<html><center>" + commentaire + "</center></html>");
	}

	@Override
	public void nouvelleQuestion(String question, String reponse) {
		commentaire.setText(" ");
	}

	@Override
	public void nouveauNombreDePoints(int points) {
	}

	@Override
	public void nouveauNombrePointsRestant(int points) {
	}

	@Override
	public void nouveauTempsRestant(int temps) {
	}

	@Override
	public void debut() {
	}

	@Override
	public void nouvelleErreur(String erreur) {
	}

	@Override
	public void stopReponse() {
	}

	@Override
	public void bonneReponse() {
	}

	@Override
	public void mauvaiseReponse() {
	}

	@Override
	public void joker(String joker) {
	}

	@Override
	public void fin(byte[] points, boolean joker) {
	}

}