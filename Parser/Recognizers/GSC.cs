using System.IO;
using System.Text;

using Iswenzz.CoD4.Parser.Runtime;
using Iswenzz.CoD4.Parser.Definitions;

namespace Iswenzz.CoD4.Parser.Recognizers
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

        public StringBuilder Stream { get; protected set; }
        public Recognizer Recognizer { get; protected set; }
        protected CompilationUnit CompilationUnit { get; set; }

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

            Stream = new StringBuilder();
            Recognizer = new(File.ReadAllText(filepath));

            Parse();
        }

        /// <summary>
        /// Parse the GSC.
        /// </summary>
        public virtual void Parse() =>
            CompilationUnit = new CompilationUnit(this, Recognizer.Parser.compilationUnit());

        /// <summary>
        /// Save the GSC.
        /// </summary>
        /// <param name="outputPath">The output path.</param>
        public virtual void Save(string outputPath)
        {
            if (!File.Exists(outputPath))
                Directory.CreateDirectory(Path.GetDirectoryName(outputPath));
            File.WriteAllText(outputPath, Stream.ToString());
        }
    }
}
