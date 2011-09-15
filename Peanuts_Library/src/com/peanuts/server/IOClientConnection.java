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

import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.StreamCorruptedException;
import java.net.InetAddress;
import java.net.Socket;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.peanuts.server.packets.ClosePackets;
import com.peanuts.server.packets.ErrorsPackets;
import com.peanuts.server.packets.Packets;

/**
 * @author Matthieu637
 * 
 */
public abstract class IOClientConnection extends Thread // implements
// ObservableConnection
{
	private static final Logger		log	= Logger.getLogger(IOClientConnection.class);
	private IOServer				parrent;

	protected Socket				s;
	protected ObjectOutputStream	out;
	protected ObjectInputStream		in;

	public IOClientConnection(IOServer parrent, Socket s, boolean uniqueIPConnection, boolean debug) {

		// TODO: flood protection

		log.setLevel(debug ? Level.DEBUG : Level.INFO);

		try {
			this.parrent = parrent;
			this.s = s;
			out = new ObjectOutputStream(s.getOutputStream());
			in = new ObjectInputStream(s.getInputStream());

			if (uniqueIPConnection) {
				if (parrent.uniqueIPConnected(this, s.getInetAddress()))
					start();
				else {
					sendPacket(new ErrorsPackets(true, ErrorsPackets.ALREADY_CONNECTED));
					sendPacket(new ClosePackets());
					close();
				}
			} else
				start();
		} catch (StreamCorruptedException e) {
			log.error("http connection");
			close();
		} catch (EOFException e) {
			log.error("local connection");
			close();
		} catch (IOException e) {
			log.error("Cannot etablish in and out", e);
			close();
		}
	}

	public abstract void closeMore();

	protected void close() {
		if (this.isAlive())
			interrupt();

		try {
			if (out != null)
				out.close();

			if (in != null)
				in.close();

			if (s != null)
				s.close();
		} catch (IOException e) {
			out = null;
			in = null;
			s = null;
		}

		parrent.remove(this);
		closeMore();
	}

	public InetAddress getInetAddress() {
		return s.getInetAddress();
	}

	protected void sendPacket(Packets p) {
		log.debug("send packet : [" + p.getClass().getName() + " ] args : " + p);
		try {
			p.finalizePacket();
			out.writeObject(p);
			out.flush();
		} catch (IOException e) {
			log.error("Cannot send packets", e);
		}
	}

	public void run() {
		Object in_packets;
		try {
			while ((in_packets = in.readObject()) != null && in_packets instanceof Packets && ((Packets) in_packets).isValid()) {
				log.debug("receive packet : [" + in_packets.getClass().getName() + "] args : " + in_packets);
				receiveRegisterPacket((Packets) in_packets);
			}
		} catch (InterruptedIOException e) {
			Thread.currentThread().interrupt();
		} catch (IOException e) {
			if (!interrupted()) {
				log.info("Deconnection brutal");
				close();
			}
		} catch (ClassNotFoundException e) {
			log.error(e);
		}
	}

	/**
	 * @param inPackets
	 */
	protected abstract void receiveRegisterPacket(Packets inPackets);
}
