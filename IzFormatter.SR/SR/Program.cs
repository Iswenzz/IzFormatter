using IzFormatter.Engine;
using IzFormatter.Engine.Runtime;

namespace IzFormatter.SR
{
    /// <summary>
    /// IzFormatter-SR CLI.
    /// </summary>
    public static class Program
    {
        /// <summary>
        /// Entry point of the program.
        /// </summary>
        /// <param name="args">CLI Arguments.</param>
        public static int Main(string[] args)
        {
            RecognizerRegistry.ReplaceRecognizer(".gsc", typeof(Recognizer));
            Formatter formatter = new();

            formatter.ParseArgs(args);
            formatter.FormatQueue();

            return formatter.Status;
        }
    }
}
