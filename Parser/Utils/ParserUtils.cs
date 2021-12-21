using System.Linq;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Misc;
using Antlr4.Runtime.Tree;

namespace Iswenzz.CoD4.Parser.Utils
{
    /// <summary>
    /// Parser utility class.
    /// </summary>
    public static class ParserUtils
    {
        /// <summary>
        /// Get childs in rule context.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IEnumerable<IParseTree> GetChilds(this ParserRuleContext context)
        {
            for (int i = 0; i < context.ChildCount; i++)
                yield return context.GetChild(i);
        }

        /// <summary>
        /// Remove all childs in rule context.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public static void RemoveChilds(this ParserRuleContext context)
        {
            int childCount = context.ChildCount;
            for (int i = 0; i < childCount; i++)
                context.RemoveLastChild();
        }

        /// <summary>
        /// Retrieve the child index from a child object in the collection.
        /// </summary>
        /// <param name="childs">The child collection.</param>
        /// <param name="child">The child to find the index.</param>
        /// <returns></returns>
        public static int IndexOfChild(IEnumerable<IParseTree> childs, dynamic child)
        {
            for (int i = 0; i < childs.Count(); i++)
            {
                IParseTree current = childs.ElementAt(i);
                Interval interval = default;

                if (child is IToken token)
                    interval = new Interval(token.TokenIndex, token.TokenIndex);
                else if (child is IParseTree context)
                    interval = context.SourceInterval;

                if (current.SourceInterval.Equals(interval))
                    return i;
            }
            return -1;
        }

        /// <summary>
        /// Checks if a child collection contains a specific token.
        /// </summary>
        /// <param name="childs">The child collection.</param>
        /// <param name="tokenType">The token type to find.</param>
        /// <returns></returns>
        public static bool ContainsToken(this IEnumerable<IParseTree> childs, int tokenType) =>
            childs.Any(c => c is ITerminalNode token && token.Symbol.Type == tokenType);
    }
}
