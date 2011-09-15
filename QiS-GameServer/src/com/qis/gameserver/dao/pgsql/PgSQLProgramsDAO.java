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

import com.peanuts.database.dao.DAO;
import com.peanuts.database.dao.SpecialFindDAO;
import com.qis.gameserver.QiSConfig;
import com.qis.gameserver.QiSGameServer;
import com.qis.gameserver.dao.object.Programs;
import com.qis.gameserver.dao.object.Questionnaire;

public class PgSQLProgramsDAO extends SpecialFindDAO<Programs>
{

	public PgSQLProgramsDAO(Connection conn)
	{
		super(conn);
	}

	@Override
	public boolean create(Programs obj)
	{
		return false;
	}

	@Override
	public boolean delete(Programs obj)
	{
		return false;
	}

	@Override
	public Programs find(int id)
	{
		return null;
	}

	@Override
	public boolean update(Programs obj)
	{
		return false;
	}

	@Override
	public Programs specialFind(String args[])
	{
		try
		{
			ResultSet result = this.connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(
					"SELECT * FROM Programming WHERE extract(week from week) = EXTRACT(WEEK FROM CURRENT_TIMESTAMP);");

			if(!QiSConfig.ACTIVE_CACHE_MEMORY_QUESTIONNAIRE)
			{
				DAO<Questionnaire> q = QiSGameServer.dao.getQuestionnaireDAO();
	
				if(result.first())
					return new Programs(result.getInt("id"), result.getString("week"), q.find(result.getInt("basketball")), q.find(result.getInt("cyclisme")), q
							.find(result.getInt("football")), q.find(result.getInt("rugby")), q.find(result.getInt("sportshiver")), q.find(result.getInt("tennis")));
			}
			else if(result.first())
			{
				
				return new Programs(result.getInt("id"), result.getString("week"), QiSGameServer.questionnaireMemory.find(result.getInt("basketball")), 
						QiSGameServer.questionnaireMemory.find(result.getInt("cyclisme")), QiSGameServer.questionnaireMemory.find(result.getInt("football")), 
						QiSGameServer.questionnaireMemory.find(result.getInt("rugby")), QiSGameServer.questionnaireMemory.find(result.getInt("sportshiver")), 
						QiSGameServer.questionnaireMemory.find(result.getInt("tennis")));
			}
		
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		return null;
	}
}
