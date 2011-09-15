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

package com.qis.commons;

public class Points {
	public static byte getPointsPerMiliSecond(long mili_second) {
		// System.out.println("Problem "+mili_second);
		if (mili_second > 12000 || mili_second < 0)
			return 25;
		if (mili_second <= 5000)
			return (byte) ((-3 * mili_second / 1000) + 100);
		else if (mili_second <= 9000)
			return (byte) ((-11.25 * (mili_second - 5000) + 85000) / 1000);
		else {
			double x = (mili_second - 9000.) / 1000.;
			return (byte) ((1 / (Math.exp(x - 2.6))) + 25);
		}
	}
}
