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

import com.peanuts.config.ConfigurationFactory;
import com.peanuts.config.Property;

public final class JDBCConfig
{
	private static boolean load=false;
	
	@Property(key = "jdbc.url", defaultValue = "jdbc:postgresql://127.0.0.1:5432/qisport_db")
	public static String	JDBC_URL;

	@Property(key = "jdbc.user", defaultValue = "qisport")
	public static String	JDBC_USER;

	@Property(key = "jdbc.password", defaultValue = "cronos")
	public static String	JDBC_PASSWORD;

	@Property(key = "jdbc.driver", defaultValue = "org.postgresql.Driver")
	public static String	JDBC_DRIVER;

	@Property(key = "jdbc.connection_max", defaultValue = "8")
	public static int		JDBC_CONNECTION_MIN;

	@Property(key = "jdbc.connection_max", defaultValue = "8")
	public static int		JDBC_CONNECTION_MAX;
	
	public static void init(String filename)
	{
		if(!load)
		{
			ConfigurationFactory.build(JDBCConfig.class,filename);
			load=true;
		}
	}
}
