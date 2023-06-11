using Iswenzz.CoD4.Parser.Runtime;
using static GSCParser;

using Antlr4.Runtime.Atn;
using Antlr4.Runtime;
using System.Text;
using System.IO;
using Antlr4.Runtime.Tree;

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
        public ParseTreeWalker Walker { get; set; }

        public GSCLexer Lexer { get; set; }
        public GSCParser Parser { get; set; }
        public GSCFormatter Formatter { get; set; }
        public GSCFormatterListener FormatterListener { get; set; }
        protected GSCErrorListener ErrorListener { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCRecognizer"/>.
        /// </summary>
        /// <param name="input">The code input.</param>
        public GSCRecognizer(string input)
        {
            // Parser & Lexer & Walker
            Stream = new StringBuilder();
            AntlrStream = new AntlrInputStream(input);
            Lexer = new GSCLexer(AntlrStream);
            TokenStream = new MultiChannelTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Parser.Interpreter.PredictionMode = PredictionMode.SLL;
            Walker = new ParseTreeWalker();
            Formatter = new GSCFormatter(this);
            FormatterListener = new GSCFormatterListener(this);

            // Error listener
            ErrorListener = new GSCErrorListener();
            Parser.RemoveErrorListeners();
            Parser.AddErrorListener(ErrorListener);

            // Parse
            Stream.Append(Formatter.Visit(Parser.compilationUnit()));
            //Walker.Walk(FormatterListener, Parser.compilationUnit());
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
