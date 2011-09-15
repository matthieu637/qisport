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
package com.peanuts.server;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

import org.apache.log4j.Logger;

/**
 * @author Matthieu637
 * 
 */
public abstract class IOServer implements Runnable {
	private static final Logger				log	= Logger.getLogger(IOServer.class);
	private ServerSocket					server;
	private boolean							uniqueIPConnection;
	private ArrayList<IOClientConnection>	connexionTable;

	public IOServer(int port, boolean uniqueIPConnection) {
		try {
			this.uniqueIPConnection = uniqueIPConnection;
			server = new ServerSocket(port);
			Thread t = new Thread(this);
			t.start();
		} catch (IOException e) {
			log.fatal("Cannot build IOServer", e);
		}

		connexionTable = new ArrayList<IOClientConnection>();
	}

	public synchronized void remove(IOClientConnection o) {
		connexionTable.remove(o);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public void run() {
		while (true) {
			try {
				connexionTable.add(getClientConnection(server.accept(), uniqueIPConnection));
			} catch (IOException e) {
				log.error("Connection failed", e);
			}
		}
	}

	protected abstract IOClientConnection getClientConnection(Socket s, boolean uniqueIPConnection);

	public synchronized boolean uniqueIPConnected(IOClientConnection o, InetAddress inetAddress) {
		for (IOClientConnection c : connexionTable)
			if (c.getInetAddress().equals(inetAddress) && !c.equals(o))
				return false;

		return true;
	}
}
