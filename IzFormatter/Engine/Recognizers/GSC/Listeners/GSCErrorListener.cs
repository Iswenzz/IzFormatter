using System;
using System.IO;
using Antlr4.Runtime;

using IzFormatter.Engine.Runtime.Base;

namespace IzFormatter.Engine.Recognizers.GSC.Listeners
{
    /// <summary>
    /// Listen for GSC errors.
    /// </summary>
    public class GSCErrorListener : ErrorListener
    {
        /// <summary>
        /// Initialize a new <see cref="GSCErrorListener"/>.
        /// </summary>
        public GSCErrorListener() : base() { }

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
            string message = $"[ERROR] line {line}:{charPositionInLine} {msg}.";
            Errors.Add(message);
            Console.WriteLine(message);
        }
    }
}
