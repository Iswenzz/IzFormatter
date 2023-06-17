using System;
using System.Collections.Generic;

using CommandLine;
using CommandLine.Text;

namespace IzFormatter.Engine.CLI
{
    /// <summary>
    /// CLI Class.
    /// </summary>
    public static class CLIParser
    {
        public static Parser Parser { get; set; }
        public static ParserResult<CLIOptions> ParserResult { get; set; }
        public static CLIOptions Options { get; set; }

        /// <summary>
        /// Parse the program arguments.
        /// </summary>
        /// <param name="args">The program arguments.</param>
        public static void Parse(string[] args)
        {
            Parser = new Parser(with => with.HelpWriter = null);
            ParserResult = Parser.ParseArguments<CLIOptions>(args);
            ParserResult
                .WithParsed(options => ParseAndExecute(Options = options))
                .WithNotParsed(DisplayHelp);
        }

        /// <summary>
        /// Display the help message.
        /// </summary>
        public static void DisplayHelp(IEnumerable<Error> errors = null)
        {
            HelpText helpText = HelpText.AutoBuild(ParserResult, (h) =>
            {
                h.AdditionalNewLineAfterOption = false;
                return HelpText.DefaultParsingErrorsHandler(ParserResult, h);
            }, e => e);
            Console.WriteLine(helpText);
        }

        /// <summary>
        /// Parse the arguments using the CommandLineParser library.
        /// </summary>
        /// <typeparam name="T">Class that implements the IExecutable class.</typeparam>
        /// <param name="options">The parsed options.</param>
        private static void ParseAndExecute<T>(T options) where T : ICLI =>
            options.Execute();
    }
}
