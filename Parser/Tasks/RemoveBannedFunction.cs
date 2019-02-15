using System;
using System.Collections.Generic;
using System.Linq;

using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.Util;
using Iswenzz.CoD4.Parser.Configs;

namespace Iswenzz.CoD4.Parser.Tasks
{
    public static partial class GSCTask
    {
        /// <summary>
        /// Remove some basic line that SR doesn't need.
        /// </summary>
        /// <param name="instance">The function.</param>
        public static List<string> RemoveBannedFunction(AbstractFunction instance)
        {
            List<string> new_lines = new List<string>();
            bool skip = true;

            foreach (string line in instance.Lines ?? Enumerable.Empty<string>())
            {
                if (skip) { skip = false; new_lines.Add(line); continue; }
                bool delete = false;

                if (BannedFunction.List.Any(l => line.Contains(l, StringComparison.InvariantCultureIgnoreCase)))
                    delete = true;

                if (delete) new_lines.Add( "//AUTO " + line);
                else new_lines.Add(line);
            }
            return new_lines;
        }
    }
}
