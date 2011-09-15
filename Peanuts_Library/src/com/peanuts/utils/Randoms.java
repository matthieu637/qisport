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

import java.util.ArrayList;

/**
 * @author Matthieu637
 * 
 */
public final class Randoms {
	public static final int ramdom(int min, int max) {
		return min + (int) (Math.random() * (max - min));
	}

	public static final int ramdomWithout(int min, int max, int[] without) {
		boolean found = true;

		int essai = ramdom(min, max);

		while (found) {
			found = false;
			for (int i = 0; i < without.length; i++)
				if (essai == without[i]) {
					found = true;
					break;
				}

			if (!found)
				return essai;

			essai = ramdom(min, max);
		}
		return 0;
	}

	public static final int ramdomWithout(int min, int max, ArrayList<Integer> without) {
		boolean found = true;

		int essai = ramdom(min, max);

		while (found) {
			found = false;
			for (int i = 0; i < without.size(); i++)
				if (essai == without.get(i)) {
					found = true;
					break;
				}

			if (!found)
				return essai;

			essai = ramdom(min, max);
		}
		return 0;
	}
}
