using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Grammar
{
	public abstract class GSCLexerBase : Lexer
	{
		private int indentLevel = 0;
		public int IndentLevel { get => indentLevel; set => indentLevel = value < 0 ? 0 : value; }

		public GSCLexerBase(ICharStream input) : base(input) { }
		public GSCLexerBase(ICharStream input, TextWriter output, TextWriter errorOutput)
			: base(input, output, errorOutput) { }

		/// <summary>
		/// Process the next token.
		/// </summary>
		/// <returns></returns>
		public override IToken NextToken()
		{
			IToken token = base.NextToken();
			switch (token.Type)
			{
				case GSCParser.Colon:
				case GSCParser.LeftBrace:
					IndentLevel++;
					break;
				case GSCParser.Newline:
					token = TokenNewLine();
					break;
			}
			Console.WriteLine($"{token.Type} {token.Text}");
			return token;
		}

		protected virtual IToken TokenNewLine()
        {
			string newLine = new Regex("[^\n\t]+").Replace(Text, "");
			int next = ((ICharStream)InputStream).LA(1);
			int nextNext = ((ICharStream)InputStream).LA(2);

			// If we're on a blank line, ignore all indents, dedents and line breaks.
			if (nextNext != -1 && (next == '\r' || next == '\n'))
				return TokenFactory.Create(GSCParser.Newline, "");

			for (int i = 1, currentChar; (currentChar = InputStream.LA(i)) != Eof; i++)
            {
				if (currentChar == '{' || currentChar == ';' || currentChar == ':') break;
				if (currentChar == '}') IndentLevel--;
            }

			string indent = string.Concat(Enumerable.Repeat('\t', IndentLevel));
			return TokenFactory.Create(GSCParser.Newline, newLine + indent);
		}
	}
}
