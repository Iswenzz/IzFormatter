using System.Collections.Generic;

namespace Iswenzz.CoD4.Parser.Configs
{
    public static class BannedFunction
    {
        /// <summary>
        /// List of all banned GSC Function.
        /// </summary>
        public static List<string> List = new List<string>
        {
            "ambientplay",
            "iprintlnbold",
            "iprintln",
            "playlocalsound",
            "kick",
            "ban",
            "sayall",
            "sayteam",
            "setmovespeed",
            "setmovespeedscale",
            "setgravity",
            "setjumpheight",
            "setrank",
            "exec",
            "print3D",
            "print",
            "println",
            "openmenu",
            "giverank",
            "getdvar(",
            "getdvar (",
            "switchtoweapon",
            "giveweapon",
            "takeallweapon",
            "givemaxammo",
            "time_limit",
            "g_speed",
            "g_gravity",
            "jump_height",
            "dr_jumper_speed",
            "dr_jumpers_speed",
            "dr_activator_speed",
            "dr_activators_speed",
        };
    }
}
