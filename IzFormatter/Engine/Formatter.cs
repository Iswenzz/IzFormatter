using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;

using IzFormatter.Engine.CLI;
using IzFormatter.Engine.Runtime.Input;
using IzFormatter.Engine.Utils;

namespace IzFormatter.Engine
{
    /// <summary>
    /// IzFormatter API.
    /// </summary>
    public class Formatter
    {
        public CLIOptions Options { get; set; }
        public Queue<FileEntry> Queue { get; set; }

        public int Total { get; set; }
        public bool AllSame { get; set; }
        public int Status { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Formatter"/>.
        /// </summary>
        public Formatter()
        {
            Queue = new();
            AllSame = true;
        }

        /// <summary>
        /// Parse the CLI arguments.
        /// </summary>
        /// <param name="args">The CLI arguments.</param>
        public void ParseArgs(string[] args)
        {
            CLIParser.Parse(args);
            Options = CLIParser.Options;
            if (Options == null)
                return;

            if (string.IsNullOrEmpty(Options.Directory))
                QueueFile(Options.File, Options.OutputDirectory);
            else
                QueueDirectory(Options.Directory, Options.AllowSubDirectories, Options.OutputDirectory);
        }

        /// <summary>
        /// Format the queue.
        /// </summary>
        public void FormatQueue()
        {
            while (Queue.Count > 0)
                Format(Queue.Dequeue());

            if (AllSame)
                Console.WriteLine($"{Total} files already formatted with IzFormatter.");
        }

        /// <summary>
        /// Format the entry file.
        /// </summary>
        /// <param name="entry">The entry file.</param>
        private void Format(FileEntry entry)
        {
            if (!entry.IsFormattable())
                return;

            Stopwatch timer = new();
            timer.Start();
            entry.Format();
            timer.Stop();

            if (!entry.IsSame())
            {
                AllSame = false;
                Console.WriteLine($"{entry.OutPath} {timer.ElapsedMilliseconds} ms");
            }
            if (entry.Recognizer.HasErrors())
                Status = -1;

            Total++;
        }

        /// <summary>
        /// Queue a file to format.
        /// </summary>
        /// <param name="filepath">The file path.</param>
        /// <param name="outpath">The output path.</param>
        public void QueueFile(string filepath, string outpath = "") =>
            Queue.Enqueue(new FileEntry(filepath, outpath));

        /// <summary>
        /// Queue a directory to format.
        /// </summary>
        /// <param name="dirpath">The directory path.</param>
        /// <param name="subdirectory">Allow subdirectories.</param>
        /// <param name="outpath">The output path.</param>
        public void QueueDirectory(string dirpath, bool subdirectory = true, string outpath = "") =>
            Directory.GetFiles(dirpath, "*", subdirectory ? SearchOption.AllDirectories
                : SearchOption.TopDirectoryOnly)
            .ForEach(path => QueueFile(path, Path.Combine(outpath, Path.GetRelativePath(dirpath, path))));
    }
}
