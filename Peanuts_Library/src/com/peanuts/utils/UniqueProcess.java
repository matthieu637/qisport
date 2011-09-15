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

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import org.apache.log4j.Logger;

/**
 * @author Matthieu637
 * 
 */
public final class UniqueProcess extends Thread
{
	private final static Logger log = Logger.getLogger(UniqueProcess.class);
	
	private final ServerSocket serv;
	
	private final static boolean isUnique(int port, boolean isServerUseSamePort)
	{
		try
		{
			Socket s = new Socket("localhost",port);
			s.getOutputStream();
			s.getInputStream();
		}
		catch (IOException e)
		{
			try
			{
				ServerSocket serv = new ServerSocket(port);
				
				if(isServerUseSamePort)
				{
					serv.close();
				}
				else
				{
					new UniqueProcess(serv);
				}
			}
			catch (IOException e1)
			{
				return false;
			}
			
			return true;
		}
		
		return false;
	}
	
	public final static void launch(int port)
	{
		launch(port, false);
	}
	
	public final static void launch(int port, boolean isServerUseSamePort)
	{
		if(!isUnique(port,isServerUseSamePort))
		{
			log.fatal("!!!! Application is already launch on port "+port+"!!!!!");
			log.fatal("#######################################################");
			log.fatal("################## ABORT LAUNCH! ######################");
			log.fatal("#######################################################");
			System.exit(1);
		}
	}

	private UniqueProcess(ServerSocket serv)
	{
		this.serv=serv;
		start();
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public void run()
	{
		try
		{
			while(serv.accept() != null);
		}
		catch (IOException e)
		{
		}
		
	}
}
