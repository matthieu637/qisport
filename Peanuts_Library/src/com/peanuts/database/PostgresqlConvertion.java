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

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class PostgresqlConvertion
{
	public static final String convert(byte [] tab)
	{
		
		StringBuilder s = new StringBuilder(tab.length*3+4);
		s.append('\'');
		s.append('{');
		
		for(int i : tab)
		{
			s.append(i);
			s.append(',');
		}
		
		s.deleteCharAt(s.length()-1);
		s.append('}');
		s.append('\'');
			
		return new String(s);
	}
	
	public static final String timestamp(long i)
	{
		Timestamp t = new Timestamp(i);
		return " timestamp '"+t+"' ";
	}
	
	public static final byte [] convert(String s)
	{
		ArrayList<Byte> r = new ArrayList<Byte>(s.length()-4);
		
		StringTokenizer st1 = new StringTokenizer(s.substring(1, s.length()-1), ",");
		
		while(st1.hasMoreTokens())
			r.add(Byte.parseByte(st1.nextToken()));
		
		int y=0;
		byte [] t = new byte [r.size()];
		
		for(byte i : r)
		{
			t[y]=i;
			y++;
		}
		
		return t;
	}
}
