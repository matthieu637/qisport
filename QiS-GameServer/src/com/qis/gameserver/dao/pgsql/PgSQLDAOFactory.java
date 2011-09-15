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

/**
 * 
 */
package com.qis.gameserver.dao.pgsql;

import java.sql.Connection;

import com.peanuts.database.dao.DAO;
import com.peanuts.database.dao.SpecialFindDAO;
import com.qis.gameserver.dao.AbstractDAOFactory;
import com.qis.gameserver.dao.object.Account;
import com.qis.gameserver.dao.object.CustomAnswer;
import com.qis.gameserver.dao.object.DefisDimanche;
import com.qis.gameserver.dao.object.Programs;
import com.qis.gameserver.dao.object.Question;
import com.qis.gameserver.dao.object.Questionnaire;
import com.qis.gameserver.dao.object.Score;

/**
 * @author Matthieu637
 * 
 */
public class PgSQLDAOFactory extends AbstractDAOFactory {

	private Connection	conn;

	/**
	 * @param connection
	 */
	public PgSQLDAOFactory(Connection conn) {
		this.conn = conn;
	}

	public DAO<Question> getQuestionDAO() {
		return new PgSQLQuestionDAO(conn);
	}

	@Override
	public SpecialFindDAO<Programs> getProgramsDAO() {
		return new PgSQLProgramsDAO(conn);
	}

	@Override
	public SpecialFindDAO<Questionnaire> getQuestionnaireDAO() {
		return new PgSQLQuestionnaireDAO(conn);
	}

	public DAO<CustomAnswer> getCustomAnswerDAO() {
		return new PgSQLCustomAnswerDAO(conn);
	}

	@Override
	public SpecialFindDAO<Score> getScoreDAO() {
		return new PgSQLScoreDAO(conn);
	}

	@Override
	public DAO<Account> getAccountDAO() {
		return new PgSQLAccountDAO(conn);
	}

	@Override
	public SpecialFindDAO<DefisDimanche> getDefisDimancheDAO() {
		return new PgSQLDefisDimancheDAO(conn);
	}

}
