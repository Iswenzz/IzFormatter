using System;
using System.Collections.Generic;

using CommandLine;
using CommandLine.Text;

namespace IzFormatter.Engine.CLI
{
    /// <summary>
    /// The program CLI.
    /// </summary>
    public class CLIOptions : ICLI
    {
        [Option('f', "file", HelpText = "The path of the file")]
        public string File { get; set; }

        [Option('d', "directory", HelpText = "The path of the directory", Required = false)]
        public string Directory { get; set; }

        [Option('o', "out", HelpText = "The path of the output directory", Required = false)]
        public string OutputDirectory { get; set; }

        [Option('s', "subdir", HelpText = "Allow searching files through sub directories", Default = true)]
        public bool AllowSubDirectories { get; set; }

        [Usage(ApplicationAlias = "IzFormatter")]
        public static IEnumerable<Example> Examples
        {
            get => new List<Example> {
                new Example("Format files",
                    new CLIOptions {
                        File = "file.gsc"
                    })
            };
        }

        /// <summary>
        /// Execute the method.
        /// </summary>
        public virtual void Execute()
        {
            if (string.IsNullOrEmpty(Directory) && string.IsNullOrEmpty(File))
            {
                CLIParser.DisplayHelp();
                Environment.Exit(-1);
                return;
            }
            if (string.IsNullOrEmpty(OutputDirectory))
                OutputDirectory = Directory;
        }
    }
}
