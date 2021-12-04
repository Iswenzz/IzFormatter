using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;

using Iswenzz.CoD4.Parser.CLI;
using Iswenzz.CoD4.Parser.File;
using Iswenzz.CoD4.Parser.Utils;

namespace Iswenzz.CoD4.Parser
{
    public static class Program
    {
        public static List<GSC> GSCs { get; private set; } = new List<GSC>();

        /// <summary>
        /// Entry point of the program.
        /// </summary>
        /// <param name="args">CLI Arguments.</param>
        public static void Main(string[] args)
        {
            CLIParser.Parse(args);
            OpenWithParser();
        }

        /// <summary>
        /// Open single file or a folder with a specific parser.
        /// </summary>
        public static void OpenWithParser()
        {
            Type parserType = Type.GetType($"Iswenzz.CoD4.Parser.File.{CLIParser.Options.Parser}");
            if (!string.IsNullOrEmpty(CLIParser.Options.GSCFolder))
                OpenDirectory(parserType);
            else
                OpenFile(parserType);
        }

        /// <summary>
        /// Create a new GSC File for each files in the directory.
        /// </summary>
        /// <param name="parserType">The parser type.</param>
        private static void OpenDirectory(Type parserType)
        {
            int index = 1;
            List<string> dirs = Directory.GetFiles(CLIParser.Options.GSCFolder, "*.gs*",
                CLIParser.Options.AllowSubDir ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly)
                .Where(dir => !dir.Contains("_new.gsc"))
                .ToList();

            Stopwatch timer = new();
            timer.Start();

            foreach (string file in dirs ?? Enumerable.Empty<string>())
            {
                if (Path.GetFileName(file).Contains("_new.gsc")) continue;

                Log.File(file, index, dirs.Count);
                GSCs.Add((GSC)Activator.CreateInstance(parserType, file));
                index++;
            }

            timer.Stop();
            Console.WriteLine($"\nParsed {--index} file(s) in {timer.Elapsed:hh\\:mm\\.ss}.");
        }

        /// <summary>
        /// Create a new GSC File.
        /// </summary>
        /// <param name="parserType">The parser type.</param>
        private static void OpenFile(Type parserType)
        {
            string file = CLIParser.Options.GSCPath;

            Stopwatch timer = new();
            timer.Start();

            Log.File(file);
            GSCs.Add((GSC)Activator.CreateInstance(parserType, file));

            timer.Stop();
            Console.WriteLine($"\nParsed 1 file in {timer.Elapsed:hh\\:mm\\.ss}.");
        }
    }
}
