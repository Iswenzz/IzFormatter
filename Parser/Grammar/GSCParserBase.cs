using System;
using System.IO;

using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Grammar
{
    /// <summary>
    /// GSC base parser.
    /// </summary>
    public class GSCParserBase : Antlr4.Runtime.Parser
    {
        public GSCFormatter Formatter { get; set; } = new();

        public override string[] RuleNames => throw new NotImplementedException();
        public override IVocabulary Vocabulary => throw new NotImplementedException();
        public override string GrammarFileName => throw new NotImplementedException();

        /// <summary>
        /// Initialize a new <see cref="GSCParserBase"/> with a token input stream.
        /// </summary>
        /// <param name="input">The token input stream.</param>
        public GSCParserBase(ITokenStream input) : base(input) { }

        /// <summary>
        /// Initialize a new <see cref="GSCParserBase"/> with a token input stream and writers.
        /// </summary>
        /// <param name="input">The token input stream.</param>
        /// <param name="output">The output text writer.</param>
        /// <param name="errorOutput">The error text writer.</param>
        public GSCParserBase(ITokenStream input, TextWriter output, TextWriter errorOutput)
            : base(input, output, errorOutput) { }

        /// <summary>
        /// On exit rule.
        /// </summary>
        public override void ExitRule()
        {
            Formatter.Rules.Add(Context);
            base.ExitRule();
        }

        /// <summary>
        /// Build the code with extra features.
        /// </summary>
        public virtual void Build() =>
            Formatter.Build();
    }
}
