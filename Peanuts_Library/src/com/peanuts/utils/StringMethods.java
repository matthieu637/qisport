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
package com.peanuts.utils;

/**
 * @author Matthieu637
 *
 */
public class StringMethods
{
	public static boolean containsIgnoreCase(String base, String contains)
	{
		return base.toUpperCase().indexOf(contains.toUpperCase()) >= 0;
	}
	
	public static boolean contains(String base, String contains)
	{
		return base.indexOf(contains) >= 0;
	}
	
	public static String replaceAccent(String s)
	{
		StringBuffer result = new StringBuffer(s.length());
		
		for(byte c : s.getBytes())
			if(c == 130 || (c >= 136 && c <= 138) )
				result.append('e');
			else if(c >= 131 && c <= 134)
				result.append('a');
			else if(c == 135 || c == 128)
				result.append('c');
			else
				result.append((char)c);
	
		return new String(result);
	}
	
	public static String removeSpecialChar(String s)
	{
		StringBuffer result = new StringBuffer(s.length());
		
		for(byte c : s.getBytes())
			if(c == ' ');
			else if(c == '\'');
			else result.append((char)c);
		
		return new String(result);	
	}
}
