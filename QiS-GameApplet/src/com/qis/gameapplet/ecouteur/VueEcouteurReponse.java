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

package com.qis.gameapplet.ecouteur;

import java.awt.Color;
import java.awt.KeyboardFocusManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Collections;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import com.peanuts.components.LimitedTextField;
import com.qis.gameapplet.Config;
import com.qis.gameapplet.modele.AbstractQuestionnaire;
import com.qis.gameapplet.vue.Vue;

@SuppressWarnings("serial")
public class VueEcouteurReponse extends JPanel implements Vue, ActionListener {

	private JButton					ok;
	private JButton					passer;
	private JButton					joker;
	private JButton					suivant;

	private JLabel					commentaire;

	private ArrayList<JTextField>	reponse;
	private AbstractQuestionnaire	modele;

	private JPanel					north, center, south_commentaire;
	private int						questions	= 0;

	@SuppressWarnings("unchecked")
	public VueEcouteurReponse(AbstractQuestionnaire mod) {
		setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

		this.modele = mod;
		reponse = new ArrayList<JTextField>();

		construireBouttonValider();
		construireBouttonPasser();
		construireBouttonJoker();

		north = new JPanel();
		north.setBackground(Color.white);
		north.setFocusTraversalKeys(KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS, Collections.EMPTY_SET);

		JPanel south = new JPanel();
		south.setLayout(new BoxLayout(south, BoxLayout.X_AXIS));
		south.setBackground(Color.white);

		center = new JPanel();
		center.setLayout(new BoxLayout(center, BoxLayout.X_AXIS));
		center.setBackground(Color.white);

		commentaire = new JLabel(" ", SwingConstants.CENTER);
		commentaire.setFont(Config.font);
		commentaire.setForeground(Config.QiSRed);

		south_commentaire = new JPanel();
		south_commentaire.setLayout(new BoxLayout(south_commentaire, BoxLayout.X_AXIS));
		south_commentaire.setBackground(Color.white);

		suivant = new JButton("Question suivante");
		suivant.setFont(Config.font);
		suivant.setVisible(false);
		suivant.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				modele.suivant();
			}
		});

		south.add(Box.createHorizontalGlue());
		south.add(ok);
		south.add(Box.createHorizontalGlue());
		south.add(joker);
		south.add(Box.createHorizontalGlue());
		south.add(passer);
		south.add(Box.createHorizontalGlue());

		center.add(Box.createHorizontalGlue());
		center.add(commentaire);
		center.add(Box.createHorizontalGlue());

		south_commentaire.add(Box.createHorizontalGlue());
		south_commentaire.add(suivant);
		south_commentaire.add(Box.createHorizontalGlue());

		this.add(Box.createVerticalGlue());
		this.add(north);
		this.add(Box.createVerticalGlue());
		this.add(center);
		this.add(Box.createVerticalGlue());
		this.add(south);
		this.add(Box.createVerticalGlue());
		this.add(south_commentaire);
		this.add(Box.createVerticalGlue());
	}

	private String recupereReponse() {
		StringBuilder resultat = new StringBuilder(reponse.size());

		for (JTextField j : reponse)
			resultat.append(j.getText().charAt(0));

		return new String(resultat);
	}

	private void effacerReponse() {
		for (JTextField j : reponse)
			if (j.isEditable())
				j.setText(null);
	}

	private void cacherComposantReponse() {
		ok.setEnabled(false);
		ok.setVisible(false);
		passer.setEnabled(false);
		passer.setVisible(false);
		joker.setVisible(false);
		commentaire.setText(" ");

		for (JTextField j : reponse)
			j.setEditable(false);
	}

	/****************************************************************************************
	 ************************************** EVENEMENTS ***********************************
	 ****************************************************************************************/

	@Override
	public void nouvelleQuestion(String question, String rep) {

		questions++;

		// reset
		reponse = new ArrayList<JTextField>(rep.length());
		north.removeAll();

		ok.setVisible(true);
		ok.setEnabled(false);
		passer.setVisible(true);
		passer.setEnabled(true);
		joker.setVisible(true);

		suivant.setVisible(false);

		/****************** COMPOSANT ******************/

		north.add(Box.createHorizontalGlue());

		for (int i = 0; i < rep.length(); i++) {
			if (rep.charAt(i) == '_') {

				JTextField lettre = new LimitedTextField(1);
				lettre.setColumns(1);
				lettre.setFont(Config.font_bold);
				lettre.setForeground(Config.QiSRed);
				lettre.setHorizontalAlignment(JTextField.CENTER);
				north.add(lettre);

				reponse.add(lettre);
			} else if (rep.charAt(i) == ' ') {
				north.add(Box.createHorizontalStrut(25));
			} else {
				JTextField j = new JTextField(String.valueOf(rep.charAt(i)));
				j.setEditable(false);
				north.add(j);

				reponse.add(j);
			}
		}

		north.add(Box.createHorizontalGlue());

		validate();

		/****************** LISTENERS ******************/

		for (int i = 0; i < reponse.size(); i++)
			reponse.get(i).addKeyListener(new EcouteurLettre(modele, reponse, ok, passer, i));

		reponse.get(0).requestFocus();
	}

	@Override
	public void mauvaiseReponse() {
		ok.setEnabled(false);
		effacerReponse();
		reponse.get(0).requestFocus();

		commentaire.setText("Essaie encore !");
	}

	@Override
	public void stopReponse() {
		cacherComposantReponse();

		suivant.setVisible(true);
		suivant.requestFocus();

		if (questions >= 5)
			suivant.setText("Terminé !");
	}

	@Override
	public void nouveauCommentaire(String commentaire, boolean positif) {
		stopReponse();
	}

	/****************************************************************************************
	 ************************************** COMPOSANTS ***********************************
	 ****************************************************************************************/

	private void construireBouttonValider() {
		ok = new JButton("Valider");
		ok.setFont(Config.font);
		ok.setForeground(Color.green);
		ok.setEnabled(false);
		ok.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				modele.ok(recupereReponse());
			}
		});

		ok.addKeyListener(new KeyAdapter() {
			@Override
			public void keyTyped(KeyEvent e) {
				if (e.getKeyChar() == 8) {
					reponse.get(reponse.size() - 1).setText(null);
					reponse.get(reponse.size() - 1).requestFocus();
					ok.setEnabled(false);
				}
			}
		});
	}

	private void construireBouttonPasser() {
		passer = new JButton("Passer");
		passer.setFont(Config.font);
		passer.setForeground(Color.red);
		passer.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				modele.passer();
			}
		});
	}

	private void construireBouttonJoker() {
		joker = new JButton("Joker");
		joker.setToolTipText("");
		joker.setFont(Config.font);
		joker.setForeground(Color.yellow);
		joker.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				modele.joker();
				joker.setEnabled(false);
			}
		});
	}

	@Override
	public void joker(String joker) {
		effacerReponse();

		for (int i = 0; i < joker.length(); i++)
			if (joker.charAt(i) != '_' && joker.charAt(i) != ' ') {
				reponse.get(i).setText(String.valueOf(joker.charAt(i)));
				reponse.get(i).setBackground(Config.QiSRed);
				reponse.get(i).setForeground(Color.WHITE);
				reponse.get(i).setEditable(false);
			}

		for (int i = 0; i < reponse.size(); i++)
			if (reponse.get(i).isEditable()) {
				reponse.get(i).requestFocus();
				break;
			}
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
	public void actionPerformed(ActionEvent e) {
	}

	@Override
	public void debut() {
	}

	@Override
	public void nouvelleErreur(String erreur) {
	}

	@Override
	public void bonneReponse() {
	}

	@Override
	public void fin(byte[] points, boolean joker) {
	}
}