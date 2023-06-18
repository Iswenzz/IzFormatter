using System;
using System.IO;

using IzFormatter.Engine.Runtime.Base;

namespace IzFormatter.Engine.Runtime.Input
{
    /// <summary>
    /// File entry class.
    /// </summary>
    public class FileEntry
    {
        public string FilePath { get; set; }
        public string FilePathWithoutExtension { get; set; }
        public string FileName { get; set; }
        public string FileExtension { get; set; }
        public string OutPath { get; set; }
        public string Input { get; set; }

        public Recognizer Recognizer { get; set; }

        /// <summary>
        /// Initialize a new <see cref="FileEntry"/>.
        /// </summary>
        /// <param name="filepath">The file path.</param>
        public FileEntry(string filepath, string outpath = "")
        {
            FilePath = filepath;
            FilePathWithoutExtension = Path.Combine(Path.GetDirectoryName(filepath),
                Path.GetFileNameWithoutExtension(filepath));
            FileName = Path.GetFileName(filepath);
            FileExtension = Path.GetExtension(filepath);
            OutPath = string.IsNullOrEmpty(outpath) ? filepath : outpath;
            Input = File.ReadAllText(filepath);
        }

        /// <summary>
        /// Format the file entry.
        /// </summary>
        public virtual void Format()
        {
            Type type = RecognizerRegistry.GetRecognizer(FileExtension);
            if (type == null)
                return;

            Recognizer = Activator.CreateInstance(type, new object[] { Input }) as Recognizer;
            Recognizer.Process();
            Save();
        }

        /// <summary>
        /// Is formattable.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsFormattable() =>
            RecognizerRegistry.GetRecognizer(FileExtension) != null;

        /// <summary>
        /// Is same size.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsSame() =>
            Recognizer.Stream.ToString() == Input;

        /// <summary>
        /// Save the file.
        /// </summary>
        protected virtual void Save()
        {
            if (IsSame())
                return;
            if (!File.Exists(OutPath))
                Directory.CreateDirectory(Path.GetDirectoryName(OutPath));
            File.WriteAllText(OutPath, Recognizer.Stream.ToString());
        }
    }
}
