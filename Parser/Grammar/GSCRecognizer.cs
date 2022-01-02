using Antlr4.Runtime;
using Antlr4.Runtime.Atn;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Listeners;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Grammar
{
    /// <summary>
    /// Language recognizer
    /// </summary>
    public class GSCRecognizer
    {
        public AntlrInputStream Stream { get; protected set; }
        public CommonTokenStream TokenStream { get; set; }
        public ParseTreeWalker Walker { get; set; }

        public GSCLexer Lexer { get; set; }
        public GSCParser Parser { get; set; }
        public GSCFormatter Formatter { get; set; }
        protected GSCErrorListener ErrorListener { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCRecognizer"/>.
        /// </summary>
        /// <param name="input">The input stream.</param>
        public GSCRecognizer(string input)
        {
            // Parser & Lexer & Walker
            Stream = new AntlrInputStream(input);
            Lexer = new GSCLexer(Stream);
            TokenStream = new CommonTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Parser.Interpreter.PredictionMode = PredictionMode.SLL;
            Formatter = new GSCFormatter();
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
            new GSCRecognizer(input).Parser.simpleInput();
    }
}
