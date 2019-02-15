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
        /// Remove all teleports delay.
        /// </summary>
        /// <param name="instance">The function.</param>
        public static List<string> RemoveTeleportsDelay(AbstractFunction instance)
        {
            List<string> new_lines = new List<string>();
            bool waittill = false;
            foreach (string line in instance.Lines ?? Enumerable.Empty<string>())
            {
                if (line.Contains("waittill")) waittill = true;
                if (waittill && line.Contains("wait ", StringComparison.InvariantCultureIgnoreCase)
                    || line.Contains("wait(", StringComparison.InvariantCultureIgnoreCase))
                    new_lines.Add("//AUTO " + line);
                else new_lines.Add(line);
            }
            return new_lines;
        }
    }
}
