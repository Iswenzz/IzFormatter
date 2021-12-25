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
        /// Get the last child of a rule.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IParseTree GetLastChild(this IParseTree context)
        {
            if (context is IToken || context.ChildCount <= 0) return context;
            return context.GetChild(context.ChildCount - 1);
        }

        /// <summary>
        /// Get the last child of a specific type.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="type">The child token type.</param>
        /// <returns></returns>
        public static IParseTree GetLastChildOfType(this IParseTree context, int type)
        {
            IParseTree result = default;
            for (int i = 0; i < context.ChildCount; i++)
            {
                IParseTree child = context.GetChild(i);
                if (child is IToken token && token.Type == type)
                    result = child;
                else if (child is ITerminalNode node && node.Symbol.Type == type)
                    result = child;
            }
            return result;
        }

        /// <summary>
        /// Recurse to get the last child of a rule.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IParseTree GetLastChildRecursion(this IParseTree context)
        {
            IParseTree child = GetLastChild(context);
            return child.Equals(context) ? context : GetLastChildRecursion(child);
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
