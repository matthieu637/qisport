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
package com.qis.gameserver.dao;

import com.peanuts.database.DatabaseFactory;
import com.peanuts.database.dao.DAO;
import com.peanuts.database.dao.SpecialFindDAO;
import com.qis.gameserver.dao.mysql.MySQLDAOFactory;
import com.qis.gameserver.dao.object.Account;
import com.qis.gameserver.dao.object.CustomAnswer;
import com.qis.gameserver.dao.object.DefisDimanche;
import com.qis.gameserver.dao.object.Programs;
import com.qis.gameserver.dao.object.Question;
import com.qis.gameserver.dao.object.Questionnaire;
import com.qis.gameserver.dao.object.Score;
import com.qis.gameserver.dao.pgsql.PgSQLDAOFactory;

/**
 * @author Matthieu637
 * 
 */
public abstract class AbstractDAOFactory {
	public static final int	PSQL_DAO_FACTORY	= 0;
	public static final int	MYSQL_DAO_FACTORY	= 1;

	public abstract DAO<Question> getQuestionDAO();

	public abstract SpecialFindDAO<Questionnaire> getQuestionnaireDAO();

	public abstract SpecialFindDAO<Programs> getProgramsDAO();

	public abstract SpecialFindDAO<Score> getScoreDAO();

	public abstract DAO<CustomAnswer> getCustomAnswerDAO();

	public abstract DAO<Account> getAccountDAO();

	public abstract SpecialFindDAO<DefisDimanche> getDefisDimancheDAO();

	public static AbstractDAOFactory getFactory(int type) {
		switch (type) {
			case PSQL_DAO_FACTORY:
				return new PgSQLDAOFactory(DatabaseFactory.getConnection());
			case MYSQL_DAO_FACTORY:
				return new MySQLDAOFactory(DatabaseFactory.getConnection());
			default:
				return null;
		}
	}

}
