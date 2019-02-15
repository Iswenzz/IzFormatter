using System.Collections.Generic;

using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.GSC;

namespace Iswenzz.CoD4.Parser.Tasks
{
    public static partial class GSCTask
    {
        /// <summary>
        /// Add custom SR normal ways to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        /// <param name="ways"><see cref="string"/> array</param>
        public static List<string> AddNormalWays(AbstractFunction instance, params string[] ways)
        {
            List<string> new_lines = instance.Lines;
            string array = "";
            foreach (string s in ways)
                array += s + ";";
            int LineIndex = 3;

            if (new_lines[LineIndex - 1] == null)
                return new_lines;

            new_lines.Insert(LineIndex,
                "\tthread speedrun\\_way_name::create_normal_way(\"" + array + "\");");

            return new_lines;
        }

        /// <summary>
        /// Add default SR normal way to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        public static List<string> AddNormalWays(SRFunction instance)
        {
            List<string> new_lines = instance.Lines;
            int LineIndex = 3;

            if (new_lines[LineIndex - 1] == null)
                return new_lines;

            new_lines.Insert(LineIndex,
                "\tthread speedrun\\_way_name::create_normal_way(\"Normal Way;\");");

            return new_lines;
        }

        /// <summary>
        /// Add custom SR secret ways to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        /// <param name="ways"><see cref="string"/> array</param>
        public static List<string> AddSecretWays(SRFunction instance, params string[] ways)
        {
            string array = "";
            foreach (string s in ways)
                array += s + ";";
            List<string> new_lines = instance.Lines;
            int LineIndex = 3;

            if (new_lines[LineIndex - 1] == null)
                return new_lines;

            new_lines.Insert(LineIndex,
                "\tthread speedrun\\_way_name::create_secret_way(\"" + array + "\");");

            return new_lines;
        }

        /// <summary>
        /// Add default SR secret way to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        public static List<string> AddSecretWays(SRFunction instance)
        {
            List<string> new_lines = instance.Lines;
            int LineIndex = 3;

            if (new_lines[LineIndex - 1] == null)
                return new_lines;

            new_lines.Insert(LineIndex,
                "\tthread speedrun\\_way_name::create_secret_way(\"Secret Way;\");");

            return new_lines;
        }
    }
}
