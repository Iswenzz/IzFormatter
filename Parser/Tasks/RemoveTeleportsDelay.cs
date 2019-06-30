using System;
using System.Collections.Generic;
using System.Linq;

using Iswenzz.CoD4.Parser.Configs;
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
        public static string RemoveTeleportsDelay(AbstractFunction instance)
        {
            if (BannedMainFunction.List.Any(l => instance.Name.Contains(l, StringComparison.InvariantCultureIgnoreCase))
                || !instance.FunctionText.Contains("waittill"))
                return instance.FunctionText;
            string new_lines = instance.FunctionText;
            string[] arr = new string[] { "wait ", "wait(" };

            foreach (string func in arr)
            {
                try
                {
                    List<int> occ = new_lines.OccurrencesIndex(func).ToList();
                    for (int i = 0; i < occ.Count; i++)
                    {
                        occ = new_lines.OccurrencesIndex(func).ToList();
                        if (new_lines.IsInsideString(occ[i]) || new_lines[new_lines.IndexOf(";", occ[i]) + 3] == '/')
                            continue;

                        int threadIndex = new_lines.IsCallStruct(occ[i]);
                        if (threadIndex != -1)
                            new_lines = new_lines.Insert(threadIndex, "/* [AUTO DELETE] ");
                        else
                            new_lines = new_lines.Insert(occ[i], "/* [AUTO DELETE] ");
                        new_lines = new_lines.Insert(new_lines.IndexOf(";", occ[i]) + 1, " */");
                    }
                }
                catch { }
            }
            return new_lines;
        }
    }
}
