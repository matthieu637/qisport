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

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import com.qis.gameapplet.Config;
import com.qis.gameapplet.modele.AbstractQuestionnaire;

@SuppressWarnings("serial")
public class EcouteurDebut extends JPanel implements ActionListener {

	private JButton					pret;
	private AbstractQuestionnaire	questionnaire;

	public EcouteurDebut(final AbstractQuestionnaire questionnaire) {
		super(new GridBagLayout());

		this.questionnaire = questionnaire;

		setBackground(Color.white);
		setVisible(true);

		JLabel texte_fixe = new JLabel("3,2,1 ...", SwingConstants.CENTER);
		texte_fixe.setFont(Config.font_20);

		pret = new JButton("C'est parti !");
		pret.addActionListener(this);
		pret.setMnemonic(KeyEvent.VK_ENTER);
		pret.setFont(Config.font_24);

		JPanel p = new JPanel();
		p.setBackground(Color.white);

		p.setLayout(new BorderLayout());
		p.add(texte_fixe, BorderLayout.NORTH);
		p.add(Box.createVerticalStrut(20), BorderLayout.CENTER);
		p.add(pret, BorderLayout.SOUTH);

		add(p, new GridBagConstraints(0, 4, 1, 1, 0, 2, GridBagConstraints.CENTER, GridBagConstraints.CENTER, new Insets(0, 0, 0, 0), 0, 0));

		JCheckBox antialiasing = new JCheckBox("Anti-aliasing");
		antialiasing.setBackground(Color.white);
		antialiasing.setFont(Config.font);
		antialiasing.setSelected(true);
		antialiasing.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e1) {
				Config.antialiasing = !Config.antialiasing;
			}
		});

		add(antialiasing, new GridBagConstraints(0, 4, 1, 4, 0, 1, GridBagConstraints.SOUTH, GridBagConstraints.SOUTH, new Insets(0, 0, 0, 0), 0, 0));

		validate();

		pret.requestFocus();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		questionnaire.start();
		pret.removeActionListener(this);
		this.remove(pret);
		pret = null;
		questionnaire = null;
	}
}