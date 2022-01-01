﻿using System.Linq;
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
        const int OPTIONAL = -1;

        /// <summary>
        /// Get childs in rule context.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IEnumerable<IParseTree> Childs(this ParserRuleContext context)
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
        /// Get the first child of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The context definition.</param>
        /// <param name="type">The context type.</param>
        /// <returns></returns>
        public static T ChildOfType<T>(this ParserRuleContext context, int type = OPTIONAL) where T : class
        {
            for (int i = 0; i < context.ChildCount; i++)
            {
                IParseTree child = context.GetChild(i);
                if (child.IsType<T>(type))
                    return (T)child;
            }
            return null;
        }

        /// <summary>
        /// Get all childs of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The context definition.</param>
        /// <param name="type">The context type.</param>
        /// <returns></returns>
        public static IEnumerable<T> ChildsOfType<T>(this ParserRuleContext context, int type = OPTIONAL)
        {
            for (int i = 0; i < context.ChildCount; i++)
            {
                IParseTree child = context.GetChild(i);
                if (child.IsType<T>(type))
                    yield return (T)child;
            }
        }

        /// <summary>
        /// Get the last child of a rule.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IParseTree LastChild(this IParseTree context)
        {
            if (context is IToken || context.ChildCount <= 0) return context;
            return context.GetChild(context.ChildCount - 1);
        }

        /// <summary>
        /// Get the last child of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The rule context.</param>
        /// <param name="type">The node type.</param>
        /// <returns></returns>
        public static T LastChildOfType<T>(this IParseTree context, int type = OPTIONAL) where T : class
        {
            T result = null;
            for (int i = 0; i < context.ChildCount; i++)
            {
                IParseTree child = context.GetChild(i);
                if (child.IsType<T>(type))
                    result = (T)child;
            }
            return result;
        }

        /// <summary>
        /// Recurse to a parent of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The rule context.</param>
        /// <param name="type">The node type.</param>
        /// <returns></returns>
        public static T RecurseParentOfType<T>(this IParseTree context, int type = OPTIONAL) where T : class
        {
            if (context.Parent != null)
            {
                if (context.Parent.IsType<T>(type))
                    return (T)context.Parent;
                else
                    return RecurseParentOfType<T>(context.Parent, type);
            }
            return null;
        }

        /// <summary>
        /// Recurse to get the last child of a rule.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IParseTree RecurseLastChild(this IParseTree context)
        {
            IParseTree child = LastChild(context);
            return child.Equals(context) ? context : RecurseLastChild(child);
        }

        /// <summary>
        /// Recurse all childs of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The context definition.</param>
        /// <param name="type">The context type.</param>
        /// <returns></returns>
        public static IEnumerable<T> RecurseChildsOfType<T>(this ParserRuleContext context, int type = OPTIONAL)
        {
            List<T> result = new();
            for (int i = 0; i < context.ChildCount; i++)
            {
                IParseTree child = context.GetChild(i);
                if (child.IsType<T>(type))
                    result.Add((T)child);
                if (child is ParserRuleContext childContext)
                    result.AddRange(RecurseChildsOfType<T>(childContext, type));
            }
            return result;
        }

        /// <summary>
        /// Checks if a child collection contains a specific token.
        /// </summary>
        /// <param name="childs">The child collection.</param>
        /// <param name="tokenType">The type to find.</param>
        /// <returns></returns>
        public static bool ContainsToken(this IEnumerable<IParseTree> childs, int tokenType) =>
            childs.Any(c => c is ITerminalNode token && token.Symbol.Type == tokenType);

        /// <summary>
        /// Check if a context is of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The context definition.</param>
        /// <param name="type">The context type.</param>
        /// <returns></returns>
        public static bool IsType<T>(this IParseTree context, int type = OPTIONAL) =>
            type == OPTIONAL ? context is T : IsType(context, type);

        /// <summary>
        /// Check if a context is of a specific type.
        /// </summary>
        /// <param name="context">The context definition.</param>
        /// <param name="type">The context type.</param>
        /// <returns></returns>
        public static bool IsType(this IParseTree context, int type)
        {
            if (context is IToken token && token.Type == type)
                return true;
            else if (context is ITerminalNode node && node.Symbol.Type == type)
                return true;
            else if (context is ParserRuleContext rule && rule.RuleIndex == type)
                return true;
            return false;
        }
    }
}
