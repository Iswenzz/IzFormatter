using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Grammar
{
    /// <summary>
    /// GSC Formatter.
    /// </summary>
    public class GSCFormatter
    {
        public virtual int IndentLevel { get; set; }

        /// <summary>
        /// Build rule and its childrens with formatting.
        /// @TODO unique ID for rules to check for rules processed.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public virtual void BuildRule(IParseTree context)
        {
            if (context is not ParserRuleContext rule)
                return;

            List<dynamic> varsNewline = rule.ReflectRuleVariables("newline");
            List<dynamic> varsDedent = rule.ReflectRuleVariables("dedent");
            List<dynamic> varsIndent = rule.ReflectRuleVariables("indent");
            List<dynamic> varsIndentShort = rule.ReflectRuleVariables("indentShort");
            List<dynamic> varsWhitespace = rule.ReflectRuleVariables("ws");
            List<dynamic> varsWhitespaceLeft = rule.ReflectRuleVariables( "wsl");
            List<dynamic> varsWhitespaceRight = rule.ReflectRuleVariables("wsr");

            ExtraNode.BuildMany(varsNewline, newline => BuildNewline(rule, newline));
            ExtraNode.BuildMany(varsIndent, indent => BuildIndent(rule, indent));
            ExtraNode.BuildMany(varsIndentShort, indentShort => BuildIndentShort(rule, indentShort));
            ExtraNode.BuildMany(varsWhitespace, ws => BuildWhitespace(rule, ws, true, true));
            ExtraNode.BuildMany(varsWhitespaceLeft, wsl => BuildWhitespace(rule, wsl, true, false));
            ExtraNode.BuildMany(varsWhitespaceRight, wsr => BuildWhitespace(rule, wsr, false, true));

            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));

            ExtraNode.BuildMany(varsDedent, dedent => BuildDedent(rule, dedent));
            if (IsComment(rule)) ExtraNode.Build(BuildComment((ParserRuleContext)rule.Parent, rule));
        }

        /// <summary>
        /// Build a comment.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildComment(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                ArrayList tree = new();
                if (node is ParserRuleContext nodeContext)
                {
                    int type = nodeContext.ChildOfType<IParseTree>(LineComment) != null ? LineComment : BlockComment;
                    string newLine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));
                    string content = type switch
                    {
                        LineComment => $"// {nodeContext.GetText()}",
                        BlockComment => $"/* {nodeContext.GetText().Trim()} */{newLine}",
                        _ => throw new NotImplementedException()
                    };

                    nodeContext.RemoveChilds();
                    nodeContext.AddChild(new CommonToken(type, content));
                    tree.Add(node);
                }
                return tree;
            }
        };

        /// <summary>
        /// Build a new line with indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildNewline(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () => new ArrayList
            {
                node,
                new CommonToken(Newline, Environment.NewLine +
                    string.Concat(Enumerable.Repeat('\t', IndentLevel)))
            }
        };

        /// <summary>
        /// Build indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildIndent(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                string newine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));
                IndentLevel++;

                ArrayList tree = new();
                tree.Add(new CommonToken(Indent));
                tree.Add(new CommonToken(Newline, newine));
                tree.AddRange(BuildNewline(context, node).BuildParseTree());
                return tree;
            }
        };

        /// <summary>
        /// Build indentation for a short statement.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildIndentShort(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                ArrayList tree = new();
                if (node is ParserRuleContext rule && rule.LastChildOfType<CompoundStatementContext>() == null)
                {
                    IndentLevel++;
                    string newine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));
                    IndentLevel--;

                    tree.Add(new CommonToken(Indent));
                    tree.Add(new CommonToken(Newline, newine));
                    tree.Add(new CommonToken(Dedent));
                }
                tree.Add(node);
                return tree;
            }
        };

        /// <summary>
        /// Build dedentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildDedent(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                IndentLevel--;
                string newLine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));

                // Dedent the previous newline
                ParserRuleContext last = (ParserRuleContext)context.RecurseLastChild().Parent;
                last.RemoveLastChild();
                last.AddChild(new CommonToken(Newline, newLine));

                return new ArrayList
                {
                    new CommonToken(Dedent),
                    node,
                    new CommonToken(Newline, newLine),
                };
            }
        };

        /// <summary>
        /// Build whitespace to the right and left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildWhitespace(ParserRuleContext context, dynamic node,
            bool left, bool right) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                ArrayList tree = new();
                if (left) tree.Add(new CommonToken(Whitespace, " "));
                tree.Add(node);
                if (right) tree.Add(new CommonToken(Whitespace, " "));
                return tree;
            }
        };

        /// <summary>
        /// Check if a rule is a comment.
        /// </summary>
        /// <param name="context">The context definition.</param>
        /// <returns></returns>
        public virtual bool IsComment(ParserRuleContext context) =>
             context.ChildOfType<IParseTree>(LineComment) != null ||
             context.ChildOfType<IParseTree>(BlockComment) != null;
    }
}
