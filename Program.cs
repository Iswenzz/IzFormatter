using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Collections.Concurrent;
using CommandLine;

using Iswenzz.CoD4.Parser.Util;
using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.GSC;

namespace Iswenzz.CoD4.Parser
{
    public static class Program 
    {
        /// <summary>
        /// Command line options.
        /// </summary>
        public class Options
        {
            [Option('f', "file", HelpText = "The path of the GSC.", Required = false)]
            public static string GSC_Path { get; set; }

            [Option('d', "directory", HelpText = "The path of the directory containing GSCs.", Required = false)]
            public static string GSC_Folder { get; set; }

            [Option('s', "subdir", HelpText = "Allow searching GSCs through sub directories. (default: true)", Required = false)]
            public static bool AllowSubDir { get; set; }

            [Option('p', "pause", HelpText = "Pause console at the end. (default: false)", Required = false)]
            public static bool PauseConsole { get; set; }

            [Option('t', "type", HelpText = "Type of function conversion. (default: SRFunction)", Required = false)]
            public static string FunctionType { get; set; }
        }

        public static void Main(string[] args)
        {
            Options.FunctionType = "SRFunction";
            Options.AllowSubDir = true;
            Options.PauseConsole = false;
            ParserResult<Options> result = CommandLine.Parser.Default.ParseArguments<Options>(args);
            Console.WriteLine("Iswenzz (c) 2019\n");
            Console.WriteLine($"\tConverting GSC with type {Options.FunctionType}:\n");

            if (string.IsNullOrEmpty(Options.GSC_Folder) && string.IsNullOrEmpty(Options.GSC_Path))
            {
                Console.WriteLine("ArgumentException: Use --help to see the command list.");
                return;
            }
            
            switch (Options.FunctionType)
            {
                case "SRFunction":  CheckParam<SRFunction>();   break;
            }

            if (Options.PauseConsole)
            {
                Console.WriteLine("\nPress any key to continue . . .");
                Console.ReadKey();
            }
        }

        /// <summary>
        /// Check if its a single file or a folder operation.
        /// </summary>
        public static void CheckParam<T>() where T : AbstractFunction
        {
            if (Options.GSC_Folder == null)
                OpenGSC<T>();
            else
                OpenDirGSC<T>();
        }

        /// <summary>
        /// Create a new GSC File for each files in the directory.
        /// </summary>
        public static void OpenDirGSC<T>() where T : AbstractFunction
        {
            int index = 1;
            List<string> dirs = Directory.GetFiles(Options.GSC_Folder, "*.gs*",
                Options.AllowSubDir ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly)
                .Where(dir => !dir.Contains("_new.gsc"))
                .ToList();

            Stopwatch timer = new Stopwatch();
            timer.Start();

            foreach (string path in dirs ?? Enumerable.Empty<string>())
            {
                if (Path.GetFileName(path).Contains("_new.gsc")) continue;
                string file = Path.GetFileNameWithoutExtension(path);
                string dir = path.Substring(0, path.IndexOf(file + ".gs"));
                string opath = dir + file + "_new.gsc";

                UtilLog.LogFile(path, index, dirs.Count);
                new GSCFile<T>(path).Save(opath);
                index++;
            }

            timer.Stop();
            Console.WriteLine($"\nParsed {index} file(s) in {timer.Elapsed.ToString("hh\\:mm\\.ss")}.");
        }

        /// <summary>
        /// Create a new GSC File.
        /// </summary>
        public static void OpenGSC<T>() where T : AbstractFunction
        {
            string file = Path.GetFileNameWithoutExtension(Options.GSC_Path);
            string dir = Options.GSC_Path.Substring(0, Options.GSC_Path.IndexOf(file + ".gs"));
            string opath = dir + file + "_new.gsc";

            Stopwatch timer = new Stopwatch();
            timer.Start();

            UtilLog.LogFile(Options.GSC_Path);
            new GSCFile<T>(Options.GSC_Path).Save(opath);

            timer.Stop();
            Console.WriteLine($"\nParsed 1 file in {timer.Elapsed.ToString("hh\\:mm\\.ss")}.");
        }
    }
}
