using System;
using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using Antlr4.Runtime;

public abstract class GSCLexerBase : Lexer
{
	private LinkedList<IToken> Tokens { get; set; } = new LinkedList<IToken>();
	private Stack<int> Indents { get; set; } = new Stack<int>();
	private IToken LastToken { get; set; }

	public GSCLexerBase(ICharStream input) : base(input) { }
	public GSCLexerBase(ICharStream input, TextWriter output, TextWriter errorOutput)
		: base(input, output, errorOutput) { }

	public override void Emit(IToken token)
	{
		base.Token = token;
		Tokens.AddLast(token);
	}

	private CommonToken CommonToken(int type, string text)
	{
		int stop = CharIndex - 1;
		int start = text.Length == 0 ? stop : stop - text.Length + 1;

		return new CommonToken(
			Tuple.Create((ITokenSource)this, (ICharStream)InputStream), 
			type, DefaultTokenChannel, start, stop);
	}

	private IToken CreateDedent()
	{
		CommonToken dedent = CommonToken(GSCParser.Dedent, "");
		dedent.Line = LastToken.Line;
		return dedent;
	}

	public override IToken NextToken()
	{
		// Check if the EOF is ahead and there are still some dedents expected.
		if (((ICharStream)InputStream).LA(1) == Eof && Indents.Count != 0)
		{
			// Remove any trailing EOF tokens from our buffer.
			for (LinkedListNode<IToken> node = Tokens.First; node != null;)
			{
				LinkedListNode<IToken> temp = node.Next;
				if (node.Value.Type == Eof)
					Tokens.Remove(node);
				node = temp;
			}

			// First emit an extra line break that serves as the end of the statement.
			Emit(CommonToken(GSCParser.Newline, "\n"));

			// Now emit as much Dedent tokens as needed.
			while (Indents.Count != 0)
			{
				Emit(CreateDedent());
				Indents.Pop();
			}

			// Put the EOF back on the token stream.
			Emit(CommonToken(GSCParser.Eof, "<EOF>"));
		}
		IToken next = base.NextToken();
        Console.WriteLine($"{next.Type} {next.Text}");

		// Keep track of the last token on the default channel.
		if (next.Channel == DefaultTokenChannel)
			LastToken = next;
		if (Tokens.Count == 0)
			return next;
		else
		{
			IToken x = Tokens.First.Value;
			Tokens.RemoveFirst();
			return x;
		}
	}

	public int GetIndentationCount(string spaces)
	{
		int count = 0;
		foreach (char ch in spaces.ToCharArray())
			count += ch == '\t' ? 4 : 1;
		return count;
	}

	public bool AtStartOfLine() =>
		Column == 0 && Line == 1;

	public void OnNewLine()
	{
		string newLine = new Regex("[^\r\n\f]+").Replace(Text, "");
		string spaces = new Regex("[\r\n\f]+").Replace(Text, "");

		// Strip newlines inside open clauses except if we are near EOF. We keep NEWLINEs near EOF to
		// satisfy the final newline needed by the single_put rule used by the REPL.
		int next = ((ICharStream)InputStream).LA(1);
		int nextnext = ((ICharStream)InputStream).LA(2);

		// If we're inside a list or on a blank line, ignore all indents, dedents and line breaks.
		if (nextnext != -1 && (next == '\r' || next == '\n' || next == '\f' || next == '#'))
			Skip();
		else
		{
			Emit(CommonToken(GSCLexer.Newline, newLine));
			int indent = GetIndentationCount(spaces);
			int previous = Indents.Count == 0 ? 0 : Indents.Peek();

			// Skip indents of the same size as the present indent-size
			if (indent == previous)
				Skip();
			else if (indent > previous)
			{
				Indents.Push(indent);
				Emit(CommonToken(GSCParser.Indent, spaces));
			}
			else
			{
				// Possibly emit more than 1 Dedent token.
				while (Indents.Count != 0 && Indents.Peek() > indent)
				{
					Emit(CreateDedent());
					Indents.Pop();
				}
			}
		}
	}
}
