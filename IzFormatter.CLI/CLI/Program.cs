using IzFormatter.Engine;

namespace IzFormatter.CLI
{
    /// <summary>
    /// IzFormatter CLI.
    /// </summary>
    public static class Program
    {
        /// <summary>
        /// Entry point of the program.
        /// </summary>
        /// <param name="args">CLI Arguments.</param>
        public static int Main(string[] args)
        {
            Formatter.ParseArgs(args);
            Formatter.FormatQueue();
            return Formatter.Status;
        }
    }
}
