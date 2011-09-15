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
package com.peanuts.client;

import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;

import com.peanuts.server.packets.ErrorsPackets;
import com.peanuts.server.packets.Packets;

/**
 * @author Matthieu637
 * 
 */
public class ServeurConnection extends Thread implements ObservableConnection {
	private Socket							s;
	private boolean							right_connection	= false;
	protected ObjectOutputStream			out;
	protected ObjectInputStream				in;

	private ArrayList<ObserverConnection>	listObservateur		= new ArrayList<ObserverConnection>();

	public ServeurConnection(String host, int port) {
		try {
			s = new Socket(host, port);
		} catch (IOException e) {
			System.out.println("Connexion au serveur impossible");
			return;
		}

		try {
			out = new ObjectOutputStream(s.getOutputStream());
			in = new ObjectInputStream(s.getInputStream());

			start();
		} catch (IOException e) {
			e.printStackTrace();
		}

		right_connection = true;
	}

	public boolean connect() {
		return right_connection;
	}

	public void close() {
		interrupt();

		try {

			if (!s.isClosed()) {
				in.close();
				out.close();
				s.close();
			}
		} catch (IOException e) {
//			e.printStackTrace();
		}

		right_connection = false;
	}

	public void sendPackets(Packets p) {
		try {
			p.finalizePacket();
			out.writeObject(p);
			out.flush();
		} catch (IOException e) {
			right_connection = false;
		}
	}

	public void run() {
		Object p;

		try {
			while ((p = in.readObject()) != null && p instanceof Packets) {
				if (p instanceof ErrorsPackets) {
					for (ObserverConnection o : this.listObservateur)
						o.receiveError((ErrorsPackets) p);
				} else {
					for (ObserverConnection o : this.listObservateur)
						o.receivePacket((Packets) p);
				}
				p = null;
			}
		} catch (InterruptedIOException e) {
			Thread.currentThread().interrupt();
			right_connection = false;
		} catch (EOFException e) {
			close();
			Thread.currentThread().interrupt();
		} catch (IOException e) {
			right_connection = false;
			close();
			if (!interrupted())
				Thread.currentThread().interrupt();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			right_connection = false;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qis.gameapplet.Observable#addObserver(com.qis.gameapplet.Observer)
	 */
	@Override
	public void addObserver(ObserverConnection obs) {
		this.listObservateur.add(obs);
	}
}
