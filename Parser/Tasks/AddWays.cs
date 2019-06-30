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
        public static string AddNormalWays(AbstractFunction instance, params string[] ways)
        {
            string new_lines = instance.FunctionText; ;
            string array = "";
            foreach (string s in ways)
                array += s + ";";

            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\tthread speedrun\\_way_name::create_normal_way(\"" + array + "\");");

            return new_lines;
        }

        /// <summary>
        /// Add default SR normal way to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        public static string AddNormalWays(SRFunction instance)
        {
            string new_lines = instance.FunctionText;

            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\tthread speedrun\\_way_name::create_normal_way(\"Normal Way;\");");

            return new_lines;
        }

        /// <summary>
        /// Add custom SR secret ways to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        /// <param name="ways"><see cref="string"/> array</param>
        public static string AddSecretWays(SRFunction instance, params string[] ways)
        {
            string array = "";
            foreach (string s in ways)
                array += s + ";";
            string new_lines = instance.FunctionText;

            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\tthread speedrun\\_way_name::create_secret_way(\"" + array + "\");");

            return new_lines;
        }

        /// <summary>
        /// Add default SR secret way to the map GSC.
        /// </summary>
        /// <param name="instance">The function</param>
        public static string AddSecretWays(SRFunction instance)
        {
            string new_lines = instance.FunctionText;

            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\tthread speedrun\\_way_name::create_secret_way(\"Secret Way;\");");

            return new_lines;
        }
    }
}
