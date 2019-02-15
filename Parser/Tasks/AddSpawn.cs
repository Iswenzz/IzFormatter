using System;
using System.Collections.Generic;
using System.Linq;

using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.Util;
using Iswenzz.CoD4.Parser.GSC;

namespace Iswenzz.CoD4.Parser.Tasks
{
    public static partial class GSCTask
    {
        /// <summary>
        /// Add a custom spawn point to the map GSC.
        /// </summary>
        /// <param name="instance">The function.</param>
        /// <param name="pos"><see cref="Vector3"/> position.</param>
        /// <param name="heading">Y Camera angle.</param>
        public static List<string> AddSpawn(AbstractFunction instance, Vector3 pos, int heading)
        {
            List<string> new_lines = instance.Lines;
            int firstThreadIndex = 0;

            for (int i = 0; i < new_lines.Count; i++)
            {
                if (new_lines[i].Contains("thread", StringComparison.InvariantCultureIgnoreCase))
                {
                    firstThreadIndex = i;
                    break;
                }
            }
            if (firstThreadIndex - 1 < 0 || new_lines[firstThreadIndex - 1] == null)
                return new_lines;

            new_lines.Insert(firstThreadIndex,
                "\tthread speedrun\\_way_name::create_spawn(" + pos.ToString() + ", " + heading + ");");

            return new_lines;
        }

        /// <summary>
        /// Add the first deathrun spawn as the map spawn point.
        /// </summary>
        /// <param name="instance">The function</param>
        public static List<string> AddSpawn(SRFunction instance)
        {
            List<string> new_lines = instance.Lines;
            int LineIndex = 3;

            if (new_lines[LineIndex - 1] == null)
                return new_lines;

            new_lines.Insert(LineIndex,
                "\t\tthread speedrun\\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);");
            new_lines.Insert(LineIndex,
                "\tif(auto_spawn.size > 0)");
            new_lines.Insert(LineIndex,
                "\tauto_spawn = getEntArray(\"mp_jumper_spawn\", \"classname\");");

            return new_lines;
        }
    }
}
