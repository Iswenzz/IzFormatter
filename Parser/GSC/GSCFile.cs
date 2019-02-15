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
        public List<string> Lines { get; set; }

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
            Lines = new List<string>(File.ReadAllLines(path));
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
            {
                foreach (string l in func.Lines ?? Enumerable.Empty<string>())
                    file += l + "\n";
                file += "\n";
            }

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
            List<int> opened = new List<int>();
            List<int> openedatline = new List<int>();
            int line_index = 0;

            try
            {
                for (int i = 0; i < Lines.Count; i++)
                {
                    line_index++;
                    if (string.IsNullOrEmpty(Lines[i]) || Lines[i] == " ") continue;
                    Regex rgx = new Regex("[^{}]");
                    string line_rgx = rgx.Replace(Lines[i], "");
                    if (string.IsNullOrEmpty(line_rgx)) continue;

                    switch (true)
                    {
                        case true when line_rgx.Length == 2 && line_rgx[0] == '}' && line_rgx[1] == '{':
                            opened.Add(opened[opened.Count - 1] - 1);
                            openedatline.Add(i);
                            opened.Add(opened[opened.Count - 1] + 1);
                            openedatline.Add(i);
                            break;
                        case true when line_rgx.Length == 2 && line_rgx[0] == '{' && line_rgx[1] == '}':
                            opened.Add(opened[opened.Count - 1] + 1);
                            openedatline.Add(i);
                            opened.Add(opened[opened.Count - 1] - 1);
                            openedatline.Add(i);
                            break;
                        case true when line_rgx[0] == '{' && opened.Count == 0:
                            opened.Add(1);
                            openedatline.Add(i);
                            break;
                        case true when line_rgx[0] == '{':
                            opened.Add(opened[opened.Count - 1] + 1);
                            openedatline.Add(i);
                            break;
                        case true when line_rgx[0] == '}':
                            opened.Add(opened[opened.Count - 1] - 1);
                            openedatline.Add(i);
                            break;
                    }

                    if (opened.Count > 0 && opened[opened.Count - 1] == 0)
                    {
                        functions.Add((T)Activator.CreateInstance(typeof(T), (Lines.ListBetween(openedatline[0] - 1,
                            openedatline[opened.Count - 1] + 1)), Name));

                        opened = new List<int>();
                        openedatline = new List<int>();
                    }
                }
            }
            catch // There is too many way to write GSC so there might be some GSC that needs manual edit.
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"{Name} crashed near line {line_index}\n");
                Console.ForegroundColor = ConsoleColor.Gray;
                throw new Exception("Parser crashed, see error log in the console.");
            }
            return functions;
        }
    }
}
