using System;
using System.IO;

using Antlr4.Runtime;

using static GSCLexer;

namespace Iswenzz.CoD4.Parser.Runtime
{
    /// <summary>
    /// Base lexer class.
    /// </summary>
	public class LexerBase : Lexer
    {
		public IToken PreviousToken { get; set; }

        public override string[] RuleNames => throw new NotImplementedException();
        public override IVocabulary Vocabulary => throw new NotImplementedException();
        public override string GrammarFileName => throw new NotImplementedException();

        /// <summary>
        /// Initialize a new <see cref="LexerBase"/>.
        /// </summary>
        /// <param name="input">The input stream.</param>
        public LexerBase(ICharStream input) : base(input) { }

        /// <summary>
        /// Initialize a new <see cref="LexerBase"/>.
        /// </summary>
        /// <param name="input">The input stream.</param>
        /// <param name="output">the output stream.</param>
        /// <param name="errorOutput">The error stream.</param>
        public LexerBase(ICharStream input, TextWriter output, TextWriter errorOutput) 
            : base(input, output, errorOutput) { }

        /// <summary>
        /// Gets the next token in the input stream.
        /// </summary>
        /// <returns></returns>
        public override IToken NextToken()
        {
            PreviousToken = Token;
			base.NextToken();

            switch (Token.Type)
            {
                case Newline:
                    return BuildNewline();
                case Whitespace:
                    return BuildWhitespace();
                case BlockComment:
                    return BuildBlockComment();
                case LineComment:
                    return BuildLineComment();
            }
            return Token;
        }

        /// <summary>
        /// Build empty new lines.
        /// </summary>
        /// <returns></returns>
		protected virtual IToken BuildNewline() =>
            BuildToken(PreviousToken?.Type == Newline ? Token.Text : string.Empty);

        /// <summary>
        /// Build whitespaces.
        /// </summary>
        /// <returns></returns>
		protected virtual IToken BuildWhitespace() =>
            BuildToken();

        /// <summary>
        /// Build block comment.
        /// </summary>
        /// <returns></returns>
		protected virtual IToken BuildBlockComment() =>
            BuildToken(Token.Text);

        /// <summary>
        /// Build line comment.
        /// </summary>
        /// <returns></returns>
		protected virtual IToken BuildLineComment() =>
            BuildToken(Token.Text);

        /// <summary>
        /// Build token for formatting.
        /// </summary>
        /// <param name="content">The token content.</param>
        /// <returns></returns>
        protected virtual IToken BuildToken(string content = "") => TokenFactory.Create(
            Tuple.Create((ITokenSource)this, Token.InputStream), Token.Type, 
            content, Token.Channel, Token.StartIndex, Token.StopIndex, Line, Token.Column);
    }
}
