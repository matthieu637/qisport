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

package com.peanuts.database;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDataSource;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.apache.log4j.Logger;

public class DatabaseFactory
{

	private static final Logger			log	= Logger.getLogger(DatabaseFactory.class);

	private static GenericObjectPool	connectionPool;
	private static DataSource			dataSource;

	public static void init()
	{
		DatabaseFactory.init("config"+File.separator+"jdbc.properties");
	}
	
	public static void init(String filename)
	{
		if(dataSource != null)
		{
			return;
		}
		
		JDBCConfig.init(filename);

		try
		{
			java.lang.Class.forName(JDBCConfig.JDBC_DRIVER).newInstance();
		}
		catch (Exception e)
		{
			log.fatal("Error obtaining DB driver", e);
			throw new Error("DB Driver doesnt exist!");
		}

		connectionPool = new GenericObjectPool();

		connectionPool.setMaxIdle(JDBCConfig.JDBC_CONNECTION_MIN);
		connectionPool.setMaxActive(JDBCConfig.JDBC_CONNECTION_MAX);

		try
		{
			dataSource = setupDataSource();
			Connection c = dataSource.getConnection();
			/** On verifie que la connection fonctionne bien **/
			c.close();
		}
		catch (Exception e)
		{
			log
					.fatal("Error with mysql connection to : " + JDBCConfig.JDBC_URL + " | user : " + JDBCConfig.JDBC_USER + " | password :"
							+ JDBCConfig.JDBC_PASSWORD);
			throw new Error("Database mysql not initialized!");
		}

		log.info("Successfully connected to database and pool initialization");
	}

	/**
	 * Sets up Connection Factory and Pool
	 * 
	 * @return DataSource configured datasource
	 * @throws Exception
	 *             if initialization failed
	 */
	private static DataSource setupDataSource() throws Exception
	{
		// Create Connection Factory
		ConnectionFactory conFactory = new DriverManagerConnectionFactory(JDBCConfig.JDBC_URL, JDBCConfig.JDBC_USER, JDBCConfig.JDBC_PASSWORD);

		// Makes Connection Factory Pool-able (Wrapper for two objects)
		new PoolableConnectionFactory(conFactory, connectionPool, null, null, false, true);

		// Create data source to utilize Factory and Pool
		return new PoolingDataSource(connectionPool);
	}
	
	public static Connection getConnection()
	{
		try
		{
			return dataSource.getConnection();
		}
		catch (SQLException e)
		{
			log.error(e);
		}
		return null;
	}
	
	public static synchronized void shutdown()
	{
		try
		{
			connectionPool.close();
		}
		catch (Exception e)
		{
			log.warn("Failed to shutdown DatabaseFactory", e);
		}

		// set datasource to null so we can call init() once more...
		dataSource = null;
	}
}
