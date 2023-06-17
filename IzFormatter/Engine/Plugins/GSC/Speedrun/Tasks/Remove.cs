using System.Linq;
using System.Collections.Generic;

using IzFormatter.Engine.Runtime;
using IzFormatter.Engine.Utils;
using IzFormatter.Engine.Recognizers.GSC;
using static GSCParser;

using Antlr4.Runtime;

namespace IzFormatter.Engine.Plugins.GSC.Speedrun.Tasks
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
            "switchtoweapon", "giveweapon", "takeallweapons", "givemaxammo", "give"
        };

        /// <summary>
        /// Remove expression of specific type.
        /// </summary>
        /// <typeparam name="T">The rule type.</typeparam>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="expressions">The expressions list.</param>
        public static void Expressions<T>(GSCRecognizer gsc, IEnumerable<T> expressions) where T : ParserRuleContext
        {
            foreach (T expression in expressions)
            {
                ExpressionStatementContext stmt = expression.RecurseLastParentOfType<ExpressionStatementContext>();
                ExpressionContext expr = expression.RecurseLastParentOfType<ExpressionContext>();

                if (stmt != null)
                    Comment.Line(gsc, stmt);
                else
                    Comment.Block(gsc, expr);
            }
        }

        /// <summary>
        /// Remove dangerous expressions.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="identifiers">The function call identifiers.</param>
        public static void DangerousExpressions(GSCRecognizer gsc, IEnumerable<IdentifierContext> identifiers) =>
            Expressions(gsc, identifiers.Where(identifier =>
            ForbiddenExpressionsList.ContainsIgnoreCase(identifier.GetText())));

        /// <summary>
        /// Remove unnecessary expressions for SR Speedrun.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="identifiers">The function call identifiers.</param>
        public static void SpeedrunUnnecessaryExpressions(GSCRecognizer gsc, IEnumerable<IdentifierContext> identifiers) =>
            Expressions(gsc, identifiers.Where(identifier =>
            SpeedrunUnnecessaryExpressionsList.ContainsIgnoreCase(identifier.GetText())));
    }
}
