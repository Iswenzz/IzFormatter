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
        public static string RemoveTraps(AbstractFunction instance)
        {
            string new_lines = instance.FunctionText;
            bool AsTrigger = false;

            if (new_lines.Contains("waittill", StringComparison.InvariantCultureIgnoreCase))
                AsTrigger = true;

            if (!AsTrigger)
                return new_lines;

            new_lines = new_lines.Insert(instance.BodyIndex, "\n\tlevel endon(\"trigger\");");
            return new_lines;
        }
    }
}
