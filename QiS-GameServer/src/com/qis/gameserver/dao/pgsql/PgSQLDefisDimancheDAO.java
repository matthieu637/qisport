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
import com.qis.gameserver.dao.object.DefisDimanche;

public class PgSQLDefisDimancheDAO extends SpecialFindDAO<DefisDimanche> {

	public PgSQLDefisDimancheDAO(Connection conn) {
		super(conn);
	}

	@Override
	public boolean create(DefisDimanche obj) {
		try {
			this.connect.createStatement().executeUpdate(
					"INSERT INTO defis_dimanche(id, id_account_1, id_account_2, id_questionnaire, sport, id_score)" + "VALUES (DEFAULT, "
							+ obj.getId_account_1() + ", null, " + obj.getId_questionnaire() + ", '" + obj.getSport().toString() + "' , " + obj.getId_score()
							+ " );");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(DefisDimanche obj) {
		return false;
	}

	@Override
	public DefisDimanche find(int id) {
		return null;
	}

	@Override
	public boolean update(DefisDimanche obj) {
		try {
			this.connect.createStatement().executeUpdate(
					"UPDATE defis_dimanche SET id_account_2 = " + obj.getId_account_2()
							+ (obj.getId_score() == -1 ? "" : " AND id_winner = " + obj.getId_winner()) + "  WHERE id = " + obj.getId() + ";");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public DefisDimanche specialFind(String[] args) {

		if (args != null && args.length == 2) {

			try {
				ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
						"SELECT * FROM defis_dimanche WHERE sport = '" + args[1] + "' AND id_account_2 IS NULL AND id_account_1 != " + args[0]
								+ " ORDER BY RANDOM() LIMIT 1;");

				if (result.first())
					return new DefisDimanche(result.getInt("id"), result.getInt("id_account_1"), result.getInt("id_questionnaire"), Sport.getInstance(result
							.getString("sport")), result.getInt("id_score"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
