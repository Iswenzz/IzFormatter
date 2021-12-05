using System.Collections.Generic;
using System.IO;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Definitions.Function;
using Iswenzz.CoD4.Parser.Definitions.Preprocessor;
using Iswenzz.CoD4.Parser.Listeners;
using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Recognizer
{
    /// <summary>
    /// GSC file.
    /// </summary>
    public class GSC
    {
        public string FilePath { get; protected set; }
        public string FilePathWithoutExtension { get; protected set; }
        public string FileName { get; protected set; }
        public string FileExtension { get; protected set; }

        public ICharStream Stream { get; protected set; }
        protected CommonTokenStream TokenStream { get; set; }
        protected ParseTreeWalker Walker { get; set; }

        protected GSCLexer Lexer { get; set; }
        protected GSCParser Parser { get; set; }
        protected GSCListener Listener { get; set; }
        protected GSCErrorListener ErrorListener { get; set; }

        public List<Include> Includes { get; protected set; }
        public virtual List<Function> Functions { get; protected set; }

        /// <summary>
        /// Initialize a new <see cref="GSC"/> file.
        /// </summary>
        /// <param name="filepath">The <see cref="GSC"/> file path.</param>
        public GSC(string filepath)
        {
            FilePath = filepath;
            FilePathWithoutExtension = Path.Combine(Path.GetDirectoryName(filepath), 
                Path.GetFileNameWithoutExtension(filepath));
            FileName = Path.GetFileName(filepath);
            FileExtension = Path.GetExtension(filepath);
            Includes = new List<Include>();
            Functions = new List<Function>();

            // Parser & Lexer & Walker
            Stream = CharStreams.fromString(File.ReadAllText(filepath));
            Lexer = new GSCLexer(Stream);
            TokenStream = new CommonTokenStream(Lexer);
            Parser = new GSCParser(TokenStream);
            Walker = new ParseTreeWalker();

            // Error listener
            ErrorListener = new GSCErrorListener();
            Parser.RemoveErrorListeners();
            Parser.AddErrorListener(ErrorListener);

            // Start
            Parse();
        }

        /// <summary>
        /// Parse the GSC.
        /// </summary>
        public virtual void Parse()
        {
            Listener = new GSCListener(this);
            CompilationUnitContext code = Parser.compilationUnit();
            Walker.Walk(Listener, code);
        }

        /// <summary>
        /// Save the GSC.
        /// </summary>
        /// <param name="outputPath">The output path.</param>
        public virtual void Save(string outputPath)
        {
            string content = "";
            Includes.ForEach(def => content += ParserUtils.SourceTextForContext(def.Context) + "\n");
            Functions.ForEach(def => content += ParserUtils.SourceTextForContext(def.Context) + "\n");

            if (!File.Exists(outputPath))
                Directory.CreateDirectory(Path.GetDirectoryName(outputPath));
            File.WriteAllText(outputPath, content);
        }
    }
}
