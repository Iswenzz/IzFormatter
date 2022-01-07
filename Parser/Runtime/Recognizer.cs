using Antlr4.Runtime;
using Antlr4.Runtime.Atn;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Listeners;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Runtime
{
    /// <summary>
    /// Language recognizer
    /// </summary>
    public class Recognizer
    {
        public AntlrInputStream Stream { get; protected set; }
        public MultiChannelTokenStream TokenStream { get; set; }
        public ParseTreeWalker Walker { get; set; }

        public GSCLexer Lexer { get; set; }
        public GSCParser Parser { get; set; }
        public Formatter Formatter { get; set; }
        protected GSCErrorListener ErrorListener { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Recognizer"/>.
        /// </summary>
        /// <param name="input">The input stream.</param>
        public Recognizer(string input)
        {
            // Parser & Lexer & Walker
            Stream = new AntlrInputStream(input);
            Lexer = new GSCLexer(Stream);
            TokenStream = new MultiChannelTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Parser.Interpreter.PredictionMode = PredictionMode.SLL;
            Formatter = new Formatter();
            Walker = new ParseTreeWalker();

            // Error listener
            ErrorListener = new GSCErrorListener();
            Parser.RemoveErrorListeners();
            Parser.AddErrorListener(ErrorListener);
        }

        /// <summary>
        /// Parse a simple input.
        /// </summary>
        /// <param name="input">The input stream.</param>
        /// <returns></returns>
        public static SimpleInputContext ParseSimpleInput(string input) =>
            new Recognizer(input).Parser.simpleInput();
    }
}
