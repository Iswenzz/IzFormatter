using System.IO;

namespace Iswenzz.CoD4.Parser.Recognizers.GSC
{
    /// <summary>
    /// GSC File.
    /// </summary>
    public class GSCFile
    {
        public string FilePath { get; set; }
        public string FilePathWithoutExtension { get; set; }
        public string FileName { get; set; }
        public string FileExtension { get; set; }
   
        public GSCRecognizer Recognizer { get; set; }
        public string Input { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCFile"/>.
        /// </summary>
        /// <param name="filepath">The file path.</param>
        public GSCFile(string filepath)
        {
            FilePath = filepath;
            FilePathWithoutExtension = Path.Combine(Path.GetDirectoryName(filepath),
                Path.GetFileNameWithoutExtension(filepath));
            FileName = Path.GetFileName(filepath);
            FileExtension = Path.GetExtension(filepath);
            Input = File.ReadAllText(filepath);
            Recognizer = new GSCRecognizer(Input);
        }

        /// <summary>
        /// Save the GSC.
        /// </summary>
        /// <param name="outputPath">The output path.</param>
        public virtual void Save(string outputPath)
        {
            if (!File.Exists(outputPath))
                Directory.CreateDirectory(Path.GetDirectoryName(outputPath));
            File.WriteAllText(outputPath, Recognizer.Stream.ToString());
        }
    }
}
