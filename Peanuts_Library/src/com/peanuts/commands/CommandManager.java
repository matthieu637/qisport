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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

import org.apache.log4j.Logger;

import com.peanuts.utils.StringMethods;

/**
 * @author Matthieu637
 *
 */
public class CommandManager extends Thread
{
	private static final Logger	log		= Logger.getLogger(CommandManager.class);
	private static boolean listen=false;
	private static Thread commandManager;
	private static Command [] commands;
	
	public static void listen(Command [] commands)
	{
		if(commandManager!=null)
		{
			listen=true;
			return;
		}
		
		Arrays.sort(commands);
		CommandManager.commands=commands;
		
		commandManager=new CommandManager();
		listen=true;
		commandManager.start();
	}
	
	public static void stopListen()
	{
		listen = false;
		commandManager=null;
	}
	
	public static Command [] getCommands()
	{
		return commands;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public void run()
	{
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String send_command;
		
		try
		{
			while(listen && (send_command = in.readLine()) != null)
			{
				if(send_command.equalsIgnoreCase("") || send_command.equalsIgnoreCase(" "));
				else
				{
					for(Command command : commands)
						if(StringMethods.containsIgnoreCase(send_command, command.getIdentifier()))
						{
							command.run(send_command);
							break;
						}
				}
			}
		}
		catch (IOException e)
		{
			log.error("Error during console readLine",e);
		}
	}

}
