using System.Text;

using Antlr4.Runtime.Atn;
using Antlr4.Runtime;

using Iswenzz.CoD4.Parser.Runtime;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Recognizers.GSC
{
    /// <summary>
    /// GSC Recognizer.
    /// </summary>
    public class GSCRecognizer
    {
        public StringBuilder Stream { get; set; }
        public AntlrInputStream AntlrStream { get; set; }
        public MultiChannelTokenStream TokenStream { get; set; }

        public GSCLexer Lexer { get; set; }
        public GSCParser Parser { get; set; }
        public GSCFormatter Formatter { get; set; }
        public GSCErrorListener ErrorListener { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCRecognizer"/>.
        /// </summary>
        /// <param name="input">The code input.</param>
        public GSCRecognizer(string input)
        {
            // Parser & Lexer & Formatter
            Stream = new StringBuilder();
            AntlrStream = new AntlrInputStream(input);
            Lexer = new GSCLexer(AntlrStream);
            TokenStream = new MultiChannelTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Parser.Interpreter.PredictionMode = PredictionMode.SLL;
            Formatter = new GSCFormatter();

            // Error listener
            ErrorListener = new GSCErrorListener();
            Parser.RemoveErrorListeners();
            Parser.AddErrorListener(ErrorListener);

            // Parse
            Stream.Append(Formatter.Visit(Parser.compilationUnit()));
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
