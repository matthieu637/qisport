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
package com.qis.gameserver.dao.mysql;

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
public class MySQLDAOFactory extends AbstractDAOFactory {

	/**
	 * @param connection
	 */
	public MySQLDAOFactory(Connection connection) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qis.gameserver.dao.AbstractDAOFactory#getQuestionDAO()
	 */
	@Override
	public DAO<Question> getQuestionDAO() {
		return null;
	}

	@Override
	public SpecialFindDAO<Programs> getProgramsDAO() {
		return null;
	}

	@Override
	public SpecialFindDAO<Questionnaire> getQuestionnaireDAO() {
		return null;
	}

	@Override
	public SpecialFindDAO<Score> getScoreDAO() {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qis.gameserver.dao.AbstractDAOFactory#getCustomAnswerDAO()
	 */
	@Override
	public DAO<CustomAnswer> getCustomAnswerDAO() {
		return null;
	}

	@Override
	public DAO<Account> getAccountDAO() {
		return null;
	}

	@Override
	public SpecialFindDAO<DefisDimanche> getDefisDimancheDAO() {
		return null;
	}

}
