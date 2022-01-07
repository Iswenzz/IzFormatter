using System.Linq;
using System.Collections.Generic;
using Antlr4.Runtime;

using Iswenzz.CoD4.Parser.Runtime;
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
            "switchtoweapon", "giveweapon", "takeallweapons", "givemaxammo", "give"
        };

        /// <summary>
        /// Remove expression of specific type.
        /// </summary>
        /// <typeparam name="T">The rule type.</typeparam>
        /// <param name="expressions">The expressions list.</param>
        public static void Expressions<T>(IEnumerable<T> expressions) where T : ParserRuleContext
        {
            foreach (T expression in expressions)
            {
                SimpleStatementContext simpleStatement = expression.RecurseLastParentOfType<SimpleStatementContext>();
                ExpressionContext expr = expression.RecurseLastParentOfType<ExpressionContext>();

                if (simpleStatement != null)
                    Comment.Line(simpleStatement);
                else
                    Comment.Block(expr);
            }
        }

        /// <summary>
        /// Remove dangerous expressions.
        /// </summary>
        /// <param name="identifiers">The function call identifiers.</param>
        public static void DangerousExpressions(IEnumerable<IdentifierContext> identifiers) => 
            Expressions(identifiers.Where(identifier => 
            ForbiddenExpressionsList.ContainsIgnoreCase(identifier.GetText())));

        /// <summary>
        /// Remove unnecessary expressions for SR Speedrun.
        /// </summary>
        /// <param name="identifiers">The function call identifiers.</param>
        public static void SpeedrunUnnecessaryExpressions(IEnumerable<IdentifierContext> identifiers) => 
            Expressions(identifiers.Where(identifier => 
            SpeedrunUnnecessaryExpressionsList.ContainsIgnoreCase(identifier.GetText())));
    }
}
