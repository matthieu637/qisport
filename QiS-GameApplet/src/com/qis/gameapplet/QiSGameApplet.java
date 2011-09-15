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

import java.awt.BorderLayout;
import java.awt.Color;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JApplet;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.UIManager;

import com.qis.gameapplet.ecouteur.EcouteurDebut;
import com.qis.gameapplet.ecouteur.VueEcouteurReponse;
import com.qis.gameapplet.modele.AbstractQuestionnaire;
import com.qis.gameapplet.modele.QuestionnaireSolo;
import com.qis.gameapplet.vue.Vue;
import com.qis.gameapplet.vue.VueCommentaire;
import com.qis.gameapplet.vue.VueHorloge;
import com.qis.gameapplet.vue.VuePointsGagne;
import com.qis.gameapplet.vue.VuePointsRestant;
import com.qis.gameapplet.vue.VueQuestion;

@SuppressWarnings("serial")
public class QiSGameApplet extends JApplet implements Vue {

	private static final int		TEMPS_POUR_UNE_REPONSE	= 12;

	private boolean					valide					= false;
	private JPanel					north, center, erreur;
	private AbstractQuestionnaire	modele;
	private EcouteurDebut			depart;
	private VueCommentaire			commentaire;
	private VueEcouteurReponse		reponse;
	private VueHorloge				horloge;
	private VuePointsGagne			point_gagne;
	private VuePointsRestant		point_restant;
	private VueQuestion				question;

	public void init() {
		Config config = new Config(this);
		if (config.estValide()) {
			modele = new QuestionnaireSolo(config);
			modele.ajouterVue(this);

			if (!modele.connexionValide())
				JOptionPane.showMessageDialog(this, "Impossible de contacter le serveur.\nVeuillez vérifier :\n- votre connexion\n- le statut du serveur.",
						"Erreur", JOptionPane.WARNING_MESSAGE);
			else
				valide = true;
		}

		super.init();
	}

	public void destroy() {

		super.destroy();
	}

	public void start() {

		if (!valide)
			return;
		
		UIManager.put("Button.defaultButtonFollowsFocus", Boolean.TRUE);

		depart = new EcouteurDebut(modele);
		this.getContentPane().add(depart, BorderLayout.CENTER);

		erreur = new JPanel();
		erreur.setBackground(Color.white);

		super.start();

		commentaire = new VueCommentaire();
		reponse = new VueEcouteurReponse(modele);
		horloge = new VueHorloge(TEMPS_POUR_UNE_REPONSE);
		point_gagne = new VuePointsGagne();
		point_restant = new VuePointsRestant();
		question = new VueQuestion();

		north = new JPanel();
		north.setBackground(Color.WHITE);
		north.setLayout(new BoxLayout(north, BoxLayout.X_AXIS));
		north.add(Box.createHorizontalGlue());
		north.add(horloge);
		north.add(Box.createHorizontalGlue());
		north.add(point_restant);
		north.add(Box.createHorizontalGlue());
		north.add(point_gagne);
		north.add(Box.createHorizontalGlue());

		center = new JPanel();
		center.setBackground(Color.WHITE);
		// center.setBorder(BorderFactory.createLineBorder(Color.black));
		center.setLayout(new BoxLayout(center, BoxLayout.Y_AXIS));
		center.add(Box.createVerticalGlue());
		center.add(question);
		center.add(reponse);
		center.add(Box.createVerticalGlue());
		center.add(commentaire);
		center.add(Box.createVerticalGlue());
	}

	@Override
	public void debut() {
		modele.ajouterVue(commentaire);
		modele.ajouterVue(reponse);
		modele.ajouterVue(horloge);
		modele.ajouterVue(point_gagne);
		modele.ajouterVue(point_restant);
		modele.ajouterVue(question);

		this.getContentPane().remove(depart);

		this.getContentPane().add(north, BorderLayout.NORTH);
		this.getContentPane().add(center, BorderLayout.CENTER);

		this.validate();
	}

	@Override
	public void nouvelleErreur(String erreur) {
		this.getContentPane().remove(north);
		this.getContentPane().remove(center);

		this.getContentPane().add(this.erreur, BorderLayout.CENTER);

		validate();

		JOptionPane.showMessageDialog(this, erreur, "Nouvelle erreur", JOptionPane.WARNING_MESSAGE);
	}

	@Override
	public void fin(byte[] points, boolean joker) {

		this.getContentPane().removeAll();
		this.setLayout(new BorderLayout());

		JPanel fin = new JPanel();
		fin.setLayout(new BorderLayout());
		fin.setBackground(Color.white);

		JLabel reca = new JLabel("<html><br /><br /><center>Récapitulatif des scores :</center></html>", SwingConstants.CENTER);
		reca.setFont(Config.font);
		reca.setForeground(Config.QiSRed);

		StringBuilder text = new StringBuilder(300);
		text.append("<html><table width='300' >");

		for (int i = 0; i < points.length; i++)
			text.append("<tr><td></td><td>" + (i + 1) + ")</td><td>" + points[i] + "</td></tr>");

		text.append("<tr><td><center>+</center></td><td><font color='rgb(150, 150, 150);'>Joker</font></td><td><font color='rgb(150, 150, 150);'>"
				+ (joker ? "15" : "0") + "</font></td></tr>");
		text
				.append("<tr><td></td><td><hr width='300' /></td></tr><tr><td colspan ='2' ><center>Score total</center></td><td><font color='rgb(193, 10, 10);' style='font-size:16px'><b>"
						+ (points[0] + points[1] + points[2] + points[3] + points[4] + (joker ? 15 : 0))
						+ "</b></font></td></table><br /><br /> <center>Sportivement.</center></html>");

		JLabel center = new JLabel(new String(text), SwingConstants.CENTER);
		center.setFont(Config.font);

		fin.add(reca, BorderLayout.NORTH);
		fin.add(center, BorderLayout.CENTER);
		this.getContentPane().add(fin, BorderLayout.CENTER);
		validate();
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
	public void nouvelleQuestion(String question, String reponse) {
	}

	@Override
	public void nouveauCommentaire(String commentaire, boolean positif) {
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
}
