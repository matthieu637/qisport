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

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JTextField;

import com.qis.gameapplet.modele.AbstractQuestionnaire;

public class EcouteurLettre extends KeyAdapter {

	private int						indice;
	private ArrayList<JTextField>	reponse;
	private JButton					ok;
	private JButton					passer;
	private AbstractQuestionnaire	modele;

	public EcouteurLettre(AbstractQuestionnaire modele, ArrayList<JTextField> answer, JButton ok, JButton passer, int current) {
		this.modele = modele;
		this.indice = current;
		this.reponse = answer;
		this.ok = ok;
		this.passer = passer;
	}

	@Override
	public void keyTyped(KeyEvent e) {
		char touche = e.getKeyChar();
		
		if (touche == 8) { // Effacer
			if (indice != 0) {
				if (reponse.get(indice - 1).isEditable()) {

					reponse.get(indice - 1).setText(null);
					reponse.get(indice - 1).requestFocus();
				} else if (indice - 2 >= 0 && reponse.get(indice - 2).isEditable()) {

					((JTextField) reponse.get(indice - 2)).setText(null);
					reponse.get(indice - 2).requestFocus();
				} else if (indice - 3 >= 0 && reponse.get(indice - 3).isEditable()) {

					((JTextField) reponse.get(indice - 3)).setText(null);
					reponse.get(indice - 3).requestFocus();
				}
			}
		} else if (!Character.isLetterOrDigit(touche)) {
			e.consume();
		} else if (indice == reponse.size() - 1) {
			if (modele.timerRunning()) {
				ok.setEnabled(true);
				ok.requestFocus();
			} else {
				passer.requestFocus();
			}
		} else if (reponse.get(indice + 1).isEditable())
			reponse.get(indice + 1).requestFocus();
		else if (indice + 2 < reponse.size() && reponse.get(indice + 2).isEditable())
			reponse.get(indice + 2).requestFocus();
		else if (indice + 3 < reponse.size() && reponse.get(indice + 3).isEditable())
			reponse.get(indice + 3).requestFocus();
	}
}
