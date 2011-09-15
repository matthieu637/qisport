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
import java.awt.FlowLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import com.qis.gameapplet.Config;

@SuppressWarnings("serial")
public class VuePointsGagne extends JPanel implements Vue {

	private JLabel	points;

	public VuePointsGagne() {
		setLayout(new FlowLayout(FlowLayout.CENTER, 0, 0));
		setBackground(Color.white);

		JLabel texte_fixe = new JLabel("Score actuel", SwingConstants.CENTER);
		texte_fixe.setFont(Config.font);

		points = new JLabel("0", SwingConstants.CENTER);
		points.setFont(Config.font);

		this.add(texte_fixe, BorderLayout.NORTH);
		this.add(points, BorderLayout.SOUTH);

		JPanel p = new JPanel();
		p.setLayout(new BorderLayout());
		p.setBackground(Color.white);
		p.add(texte_fixe, BorderLayout.NORTH);
		p.add(points, BorderLayout.SOUTH);
		this.add(p);

		setMaximumSize(p.getMinimumSize());
	}

	@Override
	public void nouveauCommentaire(String commentaire, boolean positif) {
	}

	@Override
	public void nouveauNombreDePoints(int points) {
		this.points.setText(String.valueOf(points));
	}

	@Override
	public void nouveauNombrePointsRestant(int points) {
	}

	@Override
	public void nouveauTempsRestant(int temps) {
	}

	@Override
	public void nouvelleQuestion(String question, String reponse) {
	}

	@Override
	public void debut() {
	}

	@Override
	public void nouvelleErreur(String erreur) {
	}

	@Override
	public void stopReponse() {
		// TODO Auto-generated method stub

	}

	@Override
	public void bonneReponse() {
		// TODO Auto-generated method stub

	}

	@Override
	public void mauvaiseReponse() {
		// TODO Auto-generated method stub

	}

	@Override
	public void joker(String joker) {
	}

	@Override
	public void fin(byte[] points, boolean joker) {
	}

}