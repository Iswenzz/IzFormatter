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
            bool AsTrigger = false;

            if (new_lines.Any(l => l.Contains("waittill", StringComparison.InvariantCultureIgnoreCase)))
                AsTrigger = true;

            if (!AsTrigger)
                return new_lines;

            new_lines.Insert(3, "\tlevel endon(\"trigger\");");
            return new_lines;
        }
    }
}
