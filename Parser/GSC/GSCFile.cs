using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.Util;

namespace Iswenzz.CoD4.Parser.GSC
{
    /// <summary>
    /// Create/Load a new GSC File.
    /// </summary>
    public class GSCFile<T> where T : AbstractFunction
    {
        /// <summary>
        /// Full path of the GSC File.
        /// </summary>
        public string FS { get; set; }
        public string Name { get; set; }
        public List<T> Functions { get; set; }
        public string FileText { get; set; }

        /// <summary>
        /// Load a GSC File.
        /// </summary>
        /// <param name="path">GSC Path</param>
        public GSCFile(string path)
        {
            if (string.IsNullOrEmpty(path)) throw new ArgumentException("Path is empty.");
            if (!File.Exists(path)) throw new FileNotFoundException();

            FS = path;
            Name = Path.GetFileNameWithoutExtension(path);
            FileText = File.ReadAllText(path);
            Functions = GetFunctions();
        }

        /// <summary>
        /// Save GSC File.
        /// </summary>
        /// <param name="path">Path of the saved GSC file.</param>
        public void Save(string path)
        {
            if (string.IsNullOrEmpty(path)) throw new ArgumentException("Path is empty.");

            string file = "";
            foreach (T func in Functions ?? Enumerable.Empty<T>())
                file += func.FunctionText + "\n";

            string dir = path.Substring(0, path.IndexOf(Path.GetFileName(path)));
            if (!Directory.Exists(dir) && !string.IsNullOrEmpty(dir)) Directory.CreateDirectory(dir);
            File.WriteAllText(path, file);
        }

        /// <summary>
        /// Gets all GSC functions.
        /// </summary>
        /// <returns>Function List</returns>
        public List<T> GetFunctions()
        {
            List<T> functions = new List<T>();
            try
            {
                int opened = 0;
                bool started = false;
                string currFuncText = "";

                foreach (char c in FileText)
                {
                    if (c == '{' && opened == 0 && !started)
                    {
                        started = true;
                        opened++;
                    }
                    else if (c == '{' && opened > 0) opened++;
                    else if (c == '}' && opened > 1) opened--;
                    else if (c == '}' && opened == 1 && started)
                    {
                        started = false;
                        opened--;
                        currFuncText += c;
                        functions.Add((T)Activator.CreateInstance(typeof(T), currFuncText));
                        currFuncText = "";
                        continue;
                    }
                    currFuncText += c;
                }
            }
            catch (Exception e) {/* Console.WriteLine(e);*/ }
            return functions;
        }
    }
}
