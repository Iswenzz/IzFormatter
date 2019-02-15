using System;
using System.Collections.Generic;
using System.Linq;

using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.Util;

namespace Iswenzz.CoD4.Parser.Tasks
{
    public static partial class GSCTask
    {
        /// <summary>
        /// Remove all deathrun traps.
        /// </summary>
        /// <param name="instance">The function.</param>
        public static List<string> RemoveTraps(AbstractFunction instance)
        {
            List<string> new_lines = instance.Lines;
            int firstWaitillIndex = 0;

            for (int i = 0; i < new_lines.Count; i++)
            {
                if (new_lines[i].Contains("waittill", StringComparison.InvariantCultureIgnoreCase))
                {
                    firstWaitillIndex = i;
                    break;
                }
            }
            if (firstWaitillIndex == 0)
                return new_lines;

            new_lines[firstWaitillIndex] = "/* AUTO " + new_lines[firstWaitillIndex];
            new_lines[new_lines.Count - 1] = "*/" + new_lines[new_lines.Count - 1];
            return new_lines;
        }
    }
}
