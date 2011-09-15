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
package com.peanuts.server.packets;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * @author Matthieu637
 * 
 */
public abstract class Packets implements Serializable {
	private static final long	serialVersionUID	= 1L;
	private ArrayList<Object>	args				= new ArrayList<Object>();
	private final byte			nbArgs;

	public Packets(byte i) {
		this.nbArgs = i;
	}

	protected void addArg(Object o) {
		args.add(o);
	}

	public void finalizePacket() {
		args.trimToSize();
	}

	public ArrayList<Object> getAgrs() {
		return args;
	}

	public boolean isValid() {

		if(args==null)
			return false;
		
		for (Object o : args)
			if (o == null)
				return false;

		return args.size() == nbArgs;
	}

	public String toString() {
		StringBuffer str = new StringBuffer(args.size() * 10);

		for (int i = 0; i < args.size(); i++)
			str.append(args.get(i));
		return new String(str);
	}
}
