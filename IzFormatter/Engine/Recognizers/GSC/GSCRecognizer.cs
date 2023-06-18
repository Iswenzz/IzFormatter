using Antlr4.Runtime.Atn;
using Antlr4.Runtime.Tree;
using IzFormatter.Engine.Recognizers.GSC.Formatter;
using IzFormatter.Engine.Recognizers.GSC.Listeners;
using IzFormatter.Engine.Runtime.Base;
using IzFormatter.Engine.Runtime.Stream;
using static GSCParser;

namespace IzFormatter.Engine.Recognizers.GSC
{
    /// <summary>
    /// GSC Recognizer.
    /// </summary>
    public class GSCRecognizer : Recognizer
    {
        public MultiChannelTokenStream TokenStream { get; set; }

        public GSCLexer Lexer { get; set; }
        public GSCParser Parser { get; set; }
        public GSCFormatter Formatter { get; set; }
        public GSCErrorListener ErrorListener { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCRecognizer"/>.
        /// </summary>
        /// <param name="input">The code input.</param>
        public GSCRecognizer(string input) : base(input)
        {
            // Parser & Lexer & Formatter
            Lexer = new GSCLexer(AntlrStream);
            TokenStream = new MultiChannelTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Parser.Interpreter.PredictionMode = PredictionMode.SLL;
            Formatter = new GSCFormatter();

            // Error listener
            ErrorListener = new GSCErrorListener();
            Parser.RemoveErrorListeners();
            Parser.AddErrorListener(ErrorListener);
        }

        /// <summary>
        /// Process the input.
        /// </summary>
        public override void Process()
        {
            Stream.Append(Formatter.Visit(Parser.compilationUnit()));
        }

        /// <summary>
        /// Has errors.
        /// </summary>
        /// <returns></returns>
        public override bool HasErrors() =>
            ErrorListener.Errors.Count > 0;

        /// <summary>
        /// Parse a simple input.
        /// </summary>
        /// <param name="input">The input stream.</param>
        /// <returns></returns>
        public static SimpleInputContext ParseSimpleInput(string input) =>
            new GSCRecognizer(input).Parser.simpleInput();
    }
}
