using System.Collections.Generic;
using Antlr4.Runtime;

namespace IzFormatter.Engine.Runtime
{
    /// <summary>
    /// Base error listener.
    /// </summary>
    public class ErrorListener : BaseErrorListener
    {
        public List<string> Errors { get; private set; }

        /// <summary>
        /// Initialize a new <see cref="ErrorListener"/>.
        /// </summary>
        public ErrorListener()
        {
            Errors = new();
        }
    }
}
