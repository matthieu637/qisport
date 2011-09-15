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

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryUsage;

import org.apache.log4j.Logger;

/**
 * @author Matthieu637
 *
 */
public class Performance
{
	private static final Logger log = Logger.getLogger(Performance.class);
	
	public final static int PERFORMANCE_KB = 0;
	public final static int PERFORMANCE_MB = 1;
	
	public final static void printMemoryUsage(int i)
	{
		MemoryUsage hm = ManagementFactory.getMemoryMXBean().getHeapMemoryUsage();
		MemoryUsage nhm = ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage();
		
		switch(i)
		{
		case PERFORMANCE_MB :
			
			log.info("Heap Memory Usage: " + (hm.getUsed() / 1048576) + "/" + (hm.getMax() / 1048576) + " MB");
			log.info("NonHeap Memory Usage: " + (nhm.getUsed() / 1048576) + "/" + (nhm.getMax() / 1048576) + " MB");
			break;
		case PERFORMANCE_KB :
			log.info("Heap Memory Usage: " + (hm.getUsed() / 1024) + "/" + (hm.getMax() / 1024) + " KB");
			log.info("NonHeap Memory Usage: " + (nhm.getUsed() / 1024) + "/" + (nhm.getMax() / 1024) + " KB");
			break;
		}
		
		log.info("Number of Thread : " + Thread.activeCount());
	}
}
