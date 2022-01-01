using System.Collections.Generic;
using System.Linq;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Tasks.Function
{
    /// <summary>
    /// Remove specific contexts.
    /// </summary>
    public static class Remove
    {
        public static readonly List<string> ForbiddenExpressionsList = new()
        {
            "kick", "ban", "exec", "getdvar", "setdvar"
        };

        public static readonly List<string> SpeedrunUnnecessaryExpressionsList = new()
        {
            "music", "addtestclient", "admin", "secret", "sniper", "bounce", "weapon", "knife",
            "oldway", "old", "shotgun", "ak74u", "ak47", "deagle", "menu", "vip", "mapper", "modder",
            "ambientplay", "iprintlnbold", "iprintln", "sayall", "sayteam", "setmovespeed", "setmovespeedscale",
            "setgravity", "setjumpheight", "setrank", "print3D", "print", "println", "openmenu", "giverank",
            "switchtoweapon", "giveweapon", "takeallweapons", "givemaxammo", "give", "guid"
        };

        /// <summary>
        /// Remove dangerous expressions.
        /// </summary>
        /// <param name="identifiers">The function call identifiers.</param>
        public static void DangerousExpressions(IEnumerable<IdentifierContext> identifiers) => identifiers
            .Where(identifier => ForbiddenExpressionsList.ContainsIgnoreCase(identifier.GetText()))
            .ForEach(identifier => Comment.Line(identifier.RecurseParentOfType<SimpleStatementContext>()));

        /// <summary>
        /// Remove unnecessary expressions for SR Speedrun.
        /// </summary>
        /// <param name="identifiers">The function call identifiers.</param>
        public static void SpeedrunUnnecessaryExpressions(IEnumerable<IdentifierContext> identifiers) => identifiers
            .Where(identifier => SpeedrunUnnecessaryExpressionsList.ContainsIgnoreCase(identifier.GetText()))
            .ForEach(identifier => Comment.Line(identifier.RecurseParentOfType<SimpleStatementContext>()));
    }
}
