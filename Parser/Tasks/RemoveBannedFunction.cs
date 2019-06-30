using System.Linq;
using System.Collections.Generic;

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
        public static string RemoveBannedFunction(AbstractFunction instance)
        {
            string new_lines = instance.FunctionText;

            foreach (string func in BannedFunction.List)
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
