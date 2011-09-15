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
import java.sql.ResultSet;
import java.sql.SQLException;

import com.peanuts.database.dao.DAO;
import com.qis.commons.Sport;
import com.qis.gameserver.dao.object.CustomAnswer;

/**
 * @author Matthieu637
 *
 */
public class PgSQLCustomAnswerDAO extends DAO<CustomAnswer>
{

	/**
	 * @param conn
	 */
	public PgSQLCustomAnswerDAO(Connection conn)
	{
		super(conn);
	}


	/* (non-Javadoc)
	 * @see com.qis.gameserver.dao.DAO#create(java.lang.Object)
	 */
	@Override
	public boolean create(CustomAnswer obj)
	{
		return false;
	}

	/* (non-Javadoc)
	 * @see com.qis.gameserver.dao.DAO#delete(java.lang.Object)
	 */
	@Override
	public boolean delete(CustomAnswer obj)
	{
		return false;
	}

	/* (non-Javadoc)
	 * @see com.qis.gameserver.dao.DAO#update(java.lang.Object)
	 */
	@Override
	public boolean update(CustomAnswer obj)
	{
		return false;
	}


	/* (non-Javadoc)
	 * @see com.qis.gameserver.dao.DAO#find(int)
	 */
	@Override
	public CustomAnswer find(int id)
	{
		try
		{
			ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
			"SELECT * FROM CustomAnswer WHERE id ="+id+";");
			
			if(result.first())
				return new CustomAnswer(result.getInt("id"), result.getString("answer"), result.getBoolean("good"), Sport.getInstance(result.getString("sport")));
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return null;
	}

}
