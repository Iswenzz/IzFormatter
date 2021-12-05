using System.Collections.Generic;
using System.IO;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Definitions.Function;
using Iswenzz.CoD4.Parser.Definitions.Preprocessor;
using Iswenzz.CoD4.Parser.Listeners;

using static GSCParser;

namespace Iswenzz.CoD4.Parser.File
{
    /// <summary>
    /// GSC file.
    /// </summary>
    public class GSC
    {
        public string FilePath { get; set; }
        public string FileName { get; set; }

        public ICharStream Stream { get; set; }
        public CommonTokenStream TokenStream { get; set; }
        public ParseTreeWalker Walker { get; set; }

        public GSCLexer Lexer { get; set; }
        public GSCParser Parser { get; set; }
        public GSCListener Listener { get; set; }
        public GSCErrorListener ErrorListener { get; set; }

        public List<Include> Includes { get; set; }
        public List<Function> Functions { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSC"/> file.
        /// </summary>
        /// <param name="filepath">The <see cref="GSC"/> file path.</param>
        public GSC(string filepath)
        {
            FilePath = filepath;
            FileName = Path.GetFileName(filepath);

            // Parser & Lexer
            Stream = CharStreams.fromString(System.IO.File.ReadAllText(filepath));
            Lexer = new GSCLexer(Stream);
            TokenStream = new CommonTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Listener = new GSCListener();

            // Error listener
            ErrorListener = new GSCErrorListener();
            Parser.RemoveErrorListeners();
            Parser.AddErrorListener(ErrorListener);

            // Walker
            Walker = new ParseTreeWalker();
            CompilationUnitContext code = Parser.compilationUnit();
            Walker.Walk(Listener, code);
        }
    }
}
