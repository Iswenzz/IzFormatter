using CommandLine;
using CommandLine.Text;
using System;
using System.Collections.Generic;

namespace Iswenzz.CoD4.Parser.CLI
{
    /// <summary>
    /// Class for parsing the program arguments.
    /// </summary>
    public static class CLIParser
    {
        public static CommandLine.Parser Parser { get; set; }
        public static ParserResult<Options> ParserResult { get; set; }

        public static Options Options { get; set; }

        /// <summary>
        /// Parse the program arguments.
        /// </summary>
        /// <param name="args">The program arguments.</param>
        public static void Parse(string[] args)
        {
            Parser = new CommandLine.Parser(with => with.HelpWriter = null);
            ParserResult = Parser.ParseArguments<Options>(args);
            ParserResult
                .WithParsed(options => ParseAndExecute(Options = options))
                .WithNotParsed(DisplayHelp);
        }

        /// <summary>
        /// Display the help message.
        /// </summary>
        public static void DisplayHelp(IEnumerable<Error> errors = null)
        {
            HelpText helpText = HelpText.AutoBuild(ParserResult, (HelpText h) => {
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
