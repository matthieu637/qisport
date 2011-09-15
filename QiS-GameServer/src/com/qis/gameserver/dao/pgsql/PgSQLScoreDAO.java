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

import com.peanuts.database.PostgresqlConvertion;
import com.peanuts.database.dao.SpecialFindDAO;
import com.qis.gameserver.dao.object.Score;
import com.qis.gameserver.dao.object.ScoreMode;

public class PgSQLScoreDAO extends SpecialFindDAO<Score> {

	public PgSQLScoreDAO(Connection conn) {
		super(conn);
	}

	public boolean create(Score obj) {
		try {
			ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
					"INSERT INTO scores (id, id_account, id_questionnaire, score, start_time, finish_time,score_details, score_mode)" + "VALUES (DEFAULT, "
							+ obj.getId_account() + ", " + obj.getId_questionnaire() + ", " + obj.getScore() + ","
							+ PostgresqlConvertion.timestamp(obj.getStart_time()) + " , " + PostgresqlConvertion.timestamp(obj.getFinish_time()) + " , "
							+ PostgresqlConvertion.convert(obj.getScore_details()) + " , '" + obj.getMode().toString() + "' ) RETURNING id;");

			if (result.first())
				obj.setId(result.getInt(1));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean delete(Score obj) {
		return false;
	}

	public Score find(int id) {

		try {
			ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
					"SELECT * FROM scores WHERE id = " + id + ";");

			if (result.first())
				return new Score(id, result.getInt("id_account"), result.getInt("id_questionnaire"), result.getInt("score"), 0, 0, null, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean update(Score obj) {
		return false;
	}

	public Score specialFind(String[] args) {

		try {
			if (args.length == 2 && args[0].equalsIgnoreCase("alreadyPlayDefisDimanche")) {

				ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
						"SELECT * FROM scores WHERE score_mode = 'DefisDimanche' AND "
								+ "EXTRACT(WEEK FROM start_time) = EXTRACT(WEEK FROM CURRENT_TIMESTAMP) AND "
								+ "EXTRACT(DAY FROM start_time) = EXTRACT(DAY FROM CURRENT_TIMESTAMP) "
								+ "AND EXTRACT(YEAR FROM start_time) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AND id_account = " + Integer.parseInt(args[1])
								+ ";");
				if (result.first())
					return new Score(0, 0, 0, 0, 0, 0, null, null);

			} else if (args.length == 3 && args[0].equalsIgnoreCase("getScoreFromAccountAndQuestionnaire")) {

				ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
						"SELECT * FROM Scores WHERE id_account = " + args[1] + " AND id_questionnaire = " + args[2] + ";");

				if (result.first())
					return new Score(result.getInt("id"), Integer.parseInt(args[1]), result.getInt("score"), 0, 0, 0, null, null);

			} else if (args.length == 2 && args[0] != null && args[1] != null) {

				ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
						"SELECT * FROM Scores WHERE id_account = " + args[0] + " AND id_questionnaire = " + args[1] + " AND score_mode = 'Normal';");

				if (result.first()) {

					return new Score(Integer.parseInt(args[0]), result.getInt("id_account"), result.getInt("id_questionnaire"), result.getInt("score"), result
							.getTimestamp("start_time").getTime(), result.getTimestamp("finish_time").getTime(), PostgresqlConvertion.convert(result
							.getString("score_details")), ScoreMode.getScoreMode(result.getString("score_mode")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

}
