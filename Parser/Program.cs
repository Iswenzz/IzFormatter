using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using Iswenzz.CoD4.Parser.CLI;
using Iswenzz.CoD4.Parser.Utils;
using Iswenzz.CoD4.Parser.Recognizers.GSC;

namespace Iswenzz.CoD4.Parser
{
    public static class Program
    {
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
            if (!string.IsNullOrEmpty(CLIParser.Options.GSCFolder))
                OpenDirectory();
            else
                OpenFile();
        }

        /// <summary>
        /// Create a new GSC File for each files in the directory.
        /// </summary>
        private static void OpenDirectory()
        {
            int index = 1;
            List<string> files = Directory.GetFiles(CLIParser.Options.GSCFolder, "*.gs*",
                CLIParser.Options.AllowSubDir ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly)
                .Where(dir => !dir.Contains("_new.gsc"))
                .Select(path => Path.GetRelativePath(Environment.CurrentDirectory, path))
                .ToList();

            Stopwatch timer = new();
            timer.Start();

            foreach (string file in files ?? Enumerable.Empty<string>())
            {
                Log.File(file, index, files.Count);
                Save(new GSCFile(file));
                index++;
            }

            timer.Stop();
            Console.WriteLine($"\nParsed {--index} file(s) in {timer.Elapsed:hh\\:mm\\.ss}.");
        }

        /// <summary>
        /// Create a new GSC File.
        /// </summary>
        /// <param name="parserType">The parser type.</param>
        private static void OpenFile()
        {
            string file = CLIParser.Options.GSCPath;

            Stopwatch timer = new();
            timer.Start();

            Log.File(file);
            Save(new GSCFile(file));

            timer.Stop();
            Console.WriteLine($"\nParsed 1 file in {timer.Elapsed:hh\\:mm\\.ss}.");
        }

        /// <summary>
        /// Save all GSCs.
        /// </summary>
        private static void Save(GSCFile gsc)
        {
            string path = Path.GetRelativePath(CLIParser.Options.GSCFolder, gsc.FilePathWithoutExtension);
            path = Path.Combine(CLIParser.Options.GSCOutFolder, path);
            path += CLIParser.Options.GSCFolder == CLIParser.Options.GSCOutFolder
                ? "_new.gsc" : ".gsc";
            gsc.Save(path);
        }
    }
}
