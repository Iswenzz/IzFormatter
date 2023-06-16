using System;
using System.IO;

using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Recognizers.GSC
{
    /// <summary>
    /// Base lexer class.
    /// </summary>
	public class GSCLexerBase : Lexer
    {
		public IToken PreviousToken { get; set; }

        public override string[] RuleNames => throw new NotImplementedException();
        public override IVocabulary Vocabulary => throw new NotImplementedException();
        public override string GrammarFileName => throw new NotImplementedException();

        /// <summary>
        /// Initialize a new <see cref="GSCLexerBase"/>.
        /// </summary>
        /// <param name="input">The input stream.</param>
        public GSCLexerBase(ICharStream input) : base(input) { }

        /// <summary>
        /// Initialize a new <see cref="GSCLexerBase"/>.
        /// </summary>
        /// <param name="input">The input stream.</param>
        /// <param name="output">the output stream.</param>
        /// <param name="errorOutput">The error stream.</param>
        public GSCLexerBase(ICharStream input, TextWriter output, TextWriter errorOutput) 
            : base(input, output, errorOutput) { }
    }
}
