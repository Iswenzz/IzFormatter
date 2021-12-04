using System;
using System.Collections.Generic;
using CommandLine;
using CommandLine.Text;

namespace Iswenzz.CoD4.Parser.CLI
{
    /// <summary>
    /// The program default CLI.
    /// </summary>
    public class Options : ICLI
    {
        [Option('f', "file", HelpText = "The path of the GSC")]
        public string GSCPath { get; set; }

        [Option('d', "directory", HelpText = "The path of the directory containing GSCs", Required = false)]
        public string GSCFolder { get; set; }

        [Option('o', "out", HelpText = "The path of the output directory", Required = false)]
        public string GSCOutFolder { get; set; }

        [Option('s', "subdir", HelpText = "Allow searching GSCs through sub directories", Default = true)]
        public bool AllowSubDir { get; set; }

        [Option('p', "parser", HelpText = "Parser to use", Default = "GSC")]
        public string Parser { get; set; }

        [Usage(ApplicationAlias = "gittools")]
        public static IEnumerable<Example> Examples
        {
            get => new List<Example> {
                new Example("Copy the commits on a specific date",
                    new Options {
                        Parser = "GSC",
                        GSCOutFolder = "output",
                        GSCFolder = "GSC",
                    })
            };
        }

        /// <summary>
        /// Execute the method.
        /// </summary>
        public void Execute()
        {
            if (string.IsNullOrEmpty(GSCFolder) && string.IsNullOrEmpty(GSCPath))
            {
                CLIParser.DisplayHelp();
                Environment.Exit(-1);
                return;
            }
            if (string.IsNullOrEmpty(GSCOutFolder))
                GSCOutFolder = GSCFolder;

            Console.WriteLine($"Reading with {Parser} parser:\n");
        }
    }
}
