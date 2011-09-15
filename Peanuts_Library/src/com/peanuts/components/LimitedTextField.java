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

package com.peanuts.components;

import java.awt.Toolkit;

import javax.swing.JTextField;
import javax.swing.text.AbstractDocument;
import javax.swing.text.BadLocationException;
import javax.swing.text.DocumentFilter;

@SuppressWarnings("serial")
public class LimitedTextField extends JTextField
{

	public LimitedTextField(int maxLength)
	{
		super();
		AbstractDocument doc = (AbstractDocument) getDocument();
		doc.setDocumentFilter(new TextLimiter(maxLength));

	}

	private class TextLimiter extends DocumentFilter
	{
		private int	max;

		public TextLimiter(int max)
		{
			this.max = max;
		}

		public void insertString(DocumentFilter.FilterBypass fb, int offset, String str, javax.swing.text.AttributeSet attr)
		{
			replace(fb, offset, 0, str, attr);
		}

		public void replace(DocumentFilter.FilterBypass fb, int offset, int length, String str, javax.swing.text.AttributeSet attrs)
		{
			int newLength = fb.getDocument().getLength() - length + ((str==null || str.equals("null"))?0:str.length());

			if(max == 1 && ( newLength==1 && Character.isLetterOrDigit(str.charAt(0)) ) || newLength==0 )
			{
				try
				{
					fb.replace(offset, length, str, attrs);
				}
				catch (BadLocationException e)
				{
					e.printStackTrace();
				}
			}
			else if(max != 1 && newLength <= max)
			{
				try
				{
					fb.replace(offset, length, str, attrs);
				}
				catch (BadLocationException e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				Toolkit.getDefaultToolkit().beep();
			}
		}
	}
}
