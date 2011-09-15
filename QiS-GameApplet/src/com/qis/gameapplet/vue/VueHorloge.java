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

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GridBagLayout;
import java.awt.Rectangle;
import java.awt.RenderingHints;

import javax.swing.JPanel;

import com.qis.gameapplet.Config;

@SuppressWarnings("serial")
public class VueHorloge extends JPanel implements Vue {

	private static final int	POURCENT_FLASH_BEGIN	= 25;

	private String				temps_restant_text;
	private final int			temps_restant_depart;
	private boolean				dessineOvale			= true;
	private int					animation				= 0;
	private int					temps_restant_mili;
	private boolean				clignotement			= false;

	public VueHorloge(int seconde) {
		super(new GridBagLayout());

		temps_restant_depart = seconde;
		temps_restant_mili = temps_restant_depart * 1000;

		temps_restant_text = String.valueOf(seconde);
		setBackground(Color.white);
		Dimension d = new Dimension(75, 75);
		setPreferredSize(d);
		setMaximumSize(d);
		setMinimumSize(d);
	}

	public void paintComponent(Graphics g) {
		super.paintComponent(g);

		Graphics2D g2d = (Graphics2D) g;
		Rectangle r = getBounds();

		if(Config.antialiasing)
		{
			g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
			g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
		}

		if (dessineOvale) {
			g2d.setColor(createColor(temps_restant_mili));

			int border = 2;
			int larger = 8;
			g2d.fillArc(border, border, r.width - border * 2, r.height - border * 2, 90, (temps_restant_mili * 360 / (temps_restant_depart * 1000)));

			g2d.setColor(Color.white);
			g2d.fillOval(border + larger, border + larger, r.width - border * 2 - larger * 2, r.height - border * 2 - larger * 2);
			
			g2d.setColor(Config.QiSRed);
			g2d.setFont(Config.font_bold_32);
			FontMetrics fm = g2d.getFontMetrics();

			int largeur = (int) fm.getStringBounds(temps_restant_text, null).getWidth();
			g2d.drawString(temps_restant_text, r.width / 2 - largeur / 2 + border/2, r.height / 2 + 12);
		}

	}

	private Color createColor(int time) {
		int x = temps_restant_depart * 1000 - time;

		if (x < temps_restant_depart * 1000 / 2)
			return new Color(x * 255 / 6000, 255, 0);
		else {
			return new Color(255, 255 - (x - 6000) * 255 / 6000, 0);
		}
	}

	@Override
	public void nouveauTempsRestant(int temps_mili) {
		temps_restant_mili = temps_mili;

		if (temps_mili >= 11 * 1000) {// reset
			clignotement = false;
			dessineOvale = true;
			animation = 0;
		}

		if (temps_mili > 0) {
			if (!clignotement && (temps_mili / 1000) * 100 / temps_restant_depart <= POURCENT_FLASH_BEGIN) {
				clignotement = true;
			}

			if (clignotement) {
				animation++;

				if (animation == 6) {
					dessineOvale = !dessineOvale;
					animation = 0;
				}
			}

			if (dessineOvale)
				temps_restant_text = String.valueOf(1 + temps_mili / 1000);

			repaint();
		} else {
			temps_restant_text = "0";
			repaint();
		}
	}

	@Override
	public void nouveauCommentaire(String commentaire, boolean positif) {
	}

	@Override
	public void nouveauNombreDePoints(int points) {
	}

	@Override
	public void nouveauNombrePointsRestant(int points) {
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