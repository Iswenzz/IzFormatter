using System;
using System.Linq;
using System.Reflection;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Misc;
using Antlr4.Runtime.Tree;

namespace IzFormatter.Engine.Runtime
{
    /// <summary>
    /// Parser utility class.
    /// </summary>
    public static class Utils
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
        /// Remove child at a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to remove the child.</param>
        public static void RemoveChildAt(this ParserRuleContext context, int index) =>
            context.ReplaceChilds(index, null);

        /// <summary>
        /// Add child to a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to add the child to.</param>
        /// <param name="child">The child to add.</param>
        public static void AddChildAt(this ParserRuleContext context, int index, object child) =>
            context.AddChilds(index, () => new List<dynamic> { child });

        /// <summary>
        /// Add child to a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to add the child to.</param>
        /// <param name="child">The child to add.</param>
        public static void AddChildAt(this ParserRuleContext context, int index, IToken child) =>
            context.AddChilds(index, () => new List<dynamic> { child });

        /// <summary>
        /// Add child to a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to add the child to.</param>
        /// <param name="child">The child to add.</param>
        public static void AddChildAt(this ParserRuleContext context, int index, IParseTree child) =>
            context.AddChilds(index, () => new List<dynamic> { child });

        /// <summary>
        /// Add childs to a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to add childs to.</param>
        /// <param name="childsToAdd">The childs to add.</param>
        public static void AddChilds(this ParserRuleContext context, int index, Func<List<dynamic>> childsToAdd)
        {
            List<IParseTree> childs = context.Childs().ToList();
            context.RemoveChilds();

            for (int i = 0; i < childs.Count; i++)
            {
                if (i == index)
                {
                    foreach (dynamic child in childsToAdd())
                    {
                        if (child != null)
                            context.AddChild(child);
                    }
                }
                context.AddChild((dynamic)childs[i]);
            }
        }

        /// <summary>
        /// Replace child at a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to remove the child.</param>
        /// <param name="child">The child to add.</param>
        public static void ReplaceChildAt(this ParserRuleContext context, int index, IToken child) =>
            context.ReplaceChilds(index, () => new List<dynamic> { child });

        /// <summary>
        /// Replace child at a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to remove the child.</param>
        /// <param name="child">The child to add.</param>
        public static void ReplaceChildAt(this ParserRuleContext context, int index, IParseTree child) =>
            context.ReplaceChilds(index, () => new List<dynamic> { child });

        /// <summary>
        /// Replace childs to a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="index">The index to add childs to.</param>
        /// <param name="childsToAdd">The childs to add.</param>
        public static void ReplaceChilds(this ParserRuleContext context, int index, Func<List<dynamic>> childsToAdd)
        {
            List<IParseTree> childs = context.Childs().ToList();
            context.RemoveChilds();

            for (int i = 0; i < childs.Count; i++)
            {
                if (i == index)
                {
                    foreach (dynamic child in childsToAdd())
                    {
                        if (child != null)
                            context.AddChild(child);
                    }
                }
                else
                    context.AddChild((dynamic)childs[i]);
            }
        }

        /// <summary>
        /// Retrieve the child index.
        /// </summary>
        /// <param name="context">The rule to find child.</param>
        /// <param name="child">The child to find the index.</param>
        /// <returns></returns>
        public static int IndexOfChild(this ParserRuleContext context, IToken child) =>
            context.IndexOfChild((object)child);

        /// <summary>
        /// Retrieve the child index.
        /// </summary>
        /// <param name="context">The rule to find child.</param>
        /// <param name="child">The child to find the index.</param>
        /// <returns></returns>
        public static int IndexOfChild(this ParserRuleContext context, IParseTree child) =>
            context.IndexOfChild((object)child);

        /// <summary>
        /// Retrieve the child index.
        /// </summary>
        /// <param name="context">The rule to find child.</param>
        /// <param name="child">The child to find the index.</param>
        /// <returns></returns>
        public static int IndexOfChild(this ParserRuleContext context, object child)
        {
            IEnumerable<IParseTree> childs = context.Childs();

            for (int i = 0; i < childs.Count(); i++)
            {
                IParseTree current = childs.ElementAt(i);
                Interval interval = default;

                if (child is IToken token)
                    interval = new Interval(token.TokenIndex, token.TokenIndex);
                else if (child is IParseTree tree)
                    interval = tree.SourceInterval;

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
        public static T ChildOfType<T>(this ParserRuleContext context, int type = OPTIONAL) 
            where T : class, IParseTree
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
        public static T LastChildOfType<T>(this IParseTree context, int type = OPTIONAL) 
            where T : class, IParseTree
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
        public static T RecurseParentOfType<T>(this IParseTree context, int type = OPTIONAL) 
            where T : class, IParseTree
        {
            if (context.Parent != null)
            {
                if (context.Parent.IsType<T>(type))
                    return (T)context.Parent;
                else
                    return context.Parent.RecurseParentOfType<T>(type);
            }
            return null;
        }

        /// <summary>
        /// Recurse to the last parent of a specific type.
        /// </summary>
        /// <typeparam name="T">The context type class.</typeparam>
        /// <param name="context">The rule context.</param>
        /// <param name="type">The node type.</param>
        /// <returns></returns>
        public static T RecurseLastParentOfType<T>(this IParseTree context, int type = OPTIONAL)
            where T : class, IParseTree
        {
            IParseTree current = context;
            T result = null;

            while ((current = current.Parent) != null)
            {
                if (current.IsType<T>(type))
                    result = (T)current;
            }
            return result;
        }

        /// <summary>
        /// Recurse to get the last child of a rule.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <returns></returns>
        public static IParseTree RecurseLastChild(this IParseTree context)
        {
            IParseTree child = context.LastChild();
            return child.Equals(context) ? context : child.RecurseLastChild();
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
                    result.AddRange(childContext.RecurseChildsOfType<T>(type));
            }
            return result;
        }

        /// <summary>
        /// Reflect a rule field.
        /// </summary>
        /// <param name="rule">The rule definition.</param>
        /// <param name="name">The variable defined name.</param>
        /// <returns></returns>
        public static FieldInfo ReflectRuleField(this ParserRuleContext rule, string name) =>
            rule.GetType().GetField(name);

        /// <summary>
        /// Reflect rule fields.
        /// </summary>
        /// <param name="rule">The rule definition.</param>
        /// <param name="name">The variable defined name.</param>
        /// <returns></returns>
        public static List<FieldInfo> ReflectRuleFields(this ParserRuleContext rule, string name)
        {
            List<FieldInfo> vars = new();
            foreach (FieldInfo var in rule.GetType().GetFields())
            {
                if (var.Name == name || var.Name.Split('_').First() == name)
                    vars.Add(var);
            }
            return vars;
        }

        /// <summary>
        /// Reflect rule variables.
        /// </summary>
        /// <param name="rule">The rule definition.</param>
        /// <param name="name">The variable defined name.</param>
        /// <returns></returns>
        public static List<dynamic> ReflectRuleVariables(this ParserRuleContext rule, string name)
        {
            List<dynamic> vars = new();
            foreach (FieldInfo var in rule.GetType().GetFields())
            {
                if (var.Name == name || var.Name.Split('_').First() == name)
                    vars.Add(var.GetValue(rule));
            }
            return vars;
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
            type == OPTIONAL ? context is T : context.IsType(type);

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
