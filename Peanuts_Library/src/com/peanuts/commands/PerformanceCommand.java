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
package com.peanuts.commands;

import com.peanuts.utils.Performance;

/**
 * @author Matthieu637
 *
 */
public class PerformanceCommand extends Command
{
	public PerformanceCommand()
	{
		this.identifier="PERFORMANCE";
		this.description="DISPLAY DETAILS OF MEMORY AND THREADS";
	}

	/* (non-Javadoc)
	 * @see com.matthieu637.commands.Command#run(java.lang.String)
	 */
	@Override
	public void run(String args)
	{
		Performance.printMemoryUsage(Performance.PERFORMANCE_KB);
	}

}
