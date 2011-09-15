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

package com.qis.gameserver.dao.pgsql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.peanuts.database.dao.SpecialFindDAO;
import com.qis.commons.Sport;
import com.qis.gameserver.dao.object.Question;
import com.qis.gameserver.dao.object.Questionnaire;

public class PgSQLQuestionnaireDAO extends SpecialFindDAO<Questionnaire> {

	public PgSQLQuestionnaireDAO(Connection conn) {
		super(conn);
	}

	public boolean create(Questionnaire obj) {
		return false;
	}

	public boolean delete(Questionnaire obj) {
		return false;
	}

	public Questionnaire find(int id) {
		try {
			ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
					"SELECT * FROM Questionnaires WHERE id = " + id + " ;");

			if (result.first()) {
				ResultSet result2 = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
						"SELECT id,question,answer FROM Questions WHERE id_questionnaire = " + id + " ;");

				Sport sport = Sport.getInstance(result.getString("sport"));

				Question[] quest = new Question[5];
				int i = 0;

				while (result2.next() && i < 5) {
					quest[i] = new Question(result2.getInt("id"), id, result2.getString("question"), result2.getString("answer"), sport);
					i++;
				}

				return new Questionnaire(id, sport, quest);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean update(Questionnaire obj) {
		return false;
	}

	@Override
	public Questionnaire specialFind(String[] args) {
		if (args != null) {
			if (args.length == 2 && args[0].equalsIgnoreCase("randomBySport")) {
				try {
					Sport sp = Sport.getInstance(args[1]);

					ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
							"SELECT * FROM Questionnaires ,(SELECT " + sp.toString()
									+ " AS a FROM Programming WHERE EXTRACT(week FROM week) <= EXTRACT(week FROM CURRENT_TIMESTAMP) - 1 AND "
									+ "EXTRACT(year FROM week) <= EXTRACT(year FROM CURRENT_TIMESTAMP) ) AS a WHERE a.a = Questionnaires.id "
									+ "ORDER BY RANDOM() LIMIT 1;");

					if (result.first()) {
						ResultSet result2 = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
								"SELECT id,question,answer FROM Questions WHERE id_questionnaire = " + result.getInt("id") + " ;");
						Question[] quest = new Question[5];
						int i = 0;

						while (result2.next() && i < 5) {
							quest[i] = new Question(result2.getInt("id"), result.getInt("id"), result2.getString("question"), result2.getString("answer"), sp);
							i++;
						}

						return new Questionnaire(result.getInt("id"), sp, quest);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}
}
