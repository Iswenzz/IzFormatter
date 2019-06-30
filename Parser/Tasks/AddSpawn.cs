using Iswenzz.CoD4.Parser.Abstract;
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
        public static string AddSpawn(AbstractFunction instance, Vector3 pos, int heading)
        {
            string new_lines = instance.FunctionText;

            new_lines = new_lines.Insert(instance.BodyIndex,
                "\tthread speedrun\\_way_name::create_spawn(" + pos.ToString() + ", " + heading + ");");

            return new_lines;
        }

        /// <summary>
        /// Add the first deathrun spawn as the map spawn point.
        /// </summary>
        /// <param name="instance">The function</param>
        public static string AddSpawn(SRFunction instance)
        {
            string new_lines = instance.FunctionText;

            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\t\tthread speedrun\\_way_name::create_spawn_auto(auto_spawn[int(auto_spawn.size / 2)].origin, auto_spawn[int(auto_spawn.size / 2)].angles[1]);");
            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\tif(auto_spawn.size > 0)");
            new_lines = new_lines.Insert(instance.BodyIndex,
                "\n\tauto_spawn = getEntArray(\"mp_jumper_spawn\", \"classname\");");

            return new_lines;
        }
    }
}
