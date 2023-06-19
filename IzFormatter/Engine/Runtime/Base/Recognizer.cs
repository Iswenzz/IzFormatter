using System.Text;
using Antlr4.Runtime;

namespace IzFormatter.Engine.Runtime.Base
{
    /// <summary>
    /// Recognizer class.
    /// </summary>
    public abstract class Recognizer
    {
        public StringBuilder Stream { get; set; }
        public AntlrInputStream AntlrStream { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Recognizer"/>.
        /// </summary>
        /// <param name="input">The code input.</param>
        public Recognizer(string input)
        {
            Stream = new StringBuilder();
            AntlrStream = new AntlrInputStream(input);
        }

        /// <summary>
        /// Process the input.
        /// </summary>
        public abstract void Process();

        /// <summary>
        /// Format the input.
        /// </summary>
        public abstract void Format();

        /// <summary>
        /// Has errors.
        /// </summary>
        /// <returns></returns>
        public abstract bool HasErrors();
    }
}
