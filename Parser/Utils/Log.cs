using System;

namespace Iswenzz.CoD4.Parser.Utils
{
    /// <summary>
    /// Log utility class.
    /// </summary>
    public static class Log
    {
        /// <summary>
        /// Log the current file to the console.
        /// </summary>
        /// <param name="path">File path.</param>
        public static void File(string path) =>
            File(path, 1, 1);

        /// <summary>
        /// Log the current file to the console.
        /// </summary>
        /// <param name="path">File path.</param>
        /// <param name="index">Current file index.</param>
        /// <param name="max">Max files index.</param>
        public static void File(string path, int index, int max) =>
            Console.WriteLine($"\t[{index}/{max}] Accessing {path}");
    }
}
