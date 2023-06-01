using System;
using System.IO;
using System.Collections.Generic;

using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Recognizers.GSC
{
    /// <summary>
    /// Listen for GSC errors.
    /// </summary>
    public class GSCErrorListener : BaseErrorListener
    {
        public List<string> Errors { get; private set; }

        /// <summary>
        /// Initialize a new <see cref="GSCBaseListener"/>.
        /// </summary>
        public GSCErrorListener()
        {
            Errors = new List<string>();
        }

        /// <summary>
        /// Handle syntax errors.
        /// </summary>
        /// <param name="output">The text output.</param>
        /// <param name="recognizer">Recognizer interface.</param>
        /// <param name="offendingSymbol">Offending symbol</param>
        /// <param name="line">The line number.</param>
        /// <param name="charPositionInLine">The character position in line.</param>
        /// <param name="msg">The error message.</param>
        /// <param name="e">Recognition exception.</param>
        public override void SyntaxError(TextWriter output, IRecognizer recognizer, IToken offendingSymbol,
            int line, int charPositionInLine, string msg, RecognitionException e)
        {
            string message = $"Error line {line}:{charPositionInLine} {msg}.";
            Errors.Add(message);
            Console.WriteLine(message);
        }
    }
}
