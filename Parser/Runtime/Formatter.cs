using System;
using System.Linq;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using static GSCParser;

namespace Iswenzz.CoD4.Parser.Runtime
{
    /// <summary>
    /// Formatter.
    /// </summary>
    public class Formatter
    {
        public virtual int IndentLevel { get; set; }

        /// <summary>
        /// Build rule and its childrens with formatting.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public virtual void BuildRule(IParseTree context)
        {
            if (context is not ParserRuleContext rule)
                return;

            ExtraNode.ReflectBuildMany("startline", rule, startline => BuildStartline(rule, startline));
            ExtraNode.ReflectBuildMany("startnewline", rule, startnewline => BuildStartNewline(rule, startnewline));
            ExtraNode.ReflectBuildMany("newstartline", rule, newstartline => BuildNewStartline(rule, newstartline));
            ExtraNode.ReflectBuildMany("newline", rule, newline => BuildNewline(rule, newline));
            ExtraNode.ReflectBuildMany("indent", rule, indent => BuildIndent(rule, indent));
            ExtraNode.ReflectBuildMany("indentBrace", rule, indentBrace => BuildIndentBrace(rule, indentBrace));
            ExtraNode.ReflectBuildMany("indentShort", rule, indentShort => BuildIndentShort(rule, indentShort));
            ExtraNode.ReflectBuildMany("ws", rule, ws => BuildWhitespace(rule, ws, true, true));
            ExtraNode.ReflectBuildMany("wsl", rule, wsl => BuildWhitespace(rule, wsl, true, false));
            ExtraNode.ReflectBuildMany("wsr", rule, wsr => BuildWhitespace(rule, wsr, false, true));

            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));

            if (rule is CommentContext) ExtraNode.Build(BuildComment((ParserRuleContext)rule.Parent, rule));
            ExtraNode.ReflectBuildMany("dedent", rule, dedent => BuildDedent(rule, dedent));
            ExtraNode.ReflectBuildMany("dedentBrace", rule, dedentBrace => BuildDedentBrace(rule, dedentBrace));
        }

        /// <summary>
        /// Build a comment.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildComment(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                if (node is DisabledTokensContext hiddenContext)
                    hiddenContext.AddChild(new CommonToken(Newline, Environment.NewLine));
                return new List<dynamic> { node };
            }
        };

        /// <summary>
        /// Build a start line with indentation whitespaces.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildStartline(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () => new List<dynamic>
            {
                new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))),
                node,
            }
        };

        /// <summary>
        /// Build a new line.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildNewline(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () => new List<dynamic>
            {
                node,
                new CommonToken(Newline, Environment.NewLine)
            }
        };

        /// <summary>
        /// Build indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildIndent(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                IndentLevel++;
                return new List<dynamic> { node };
            }
        };

        /// <summary>
        /// Build brace indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildIndentBrace(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                List<dynamic> tree = new();
                tree.Add(new CommonToken(Indent));
                tree.Add(new CommonToken(Newline, Environment.NewLine));
                tree.AddRange(BuildStartline(context, node).BuildParseTree());
                IndentLevel++;

                tree.Add(new CommonToken(Newline, Environment.NewLine));
                return tree;
            }
        };

        /// <summary>
        /// Build indentation for a short statement.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildIndentShort(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                if (node is ParserRuleContext rule && rule.LastChildOfType<CompoundStatementContext>() == null)
                {
                    List<dynamic> tree = new();

                    IndentLevel++;
                    tree.Add(new CommonToken(Newline, Environment.NewLine));
                    tree.Add(new CommonToken(Indent));
                    tree.AddRange(BuildStartline(context, node).BuildParseTree());
                    rule.ReflectRuleField("startline")?.SetValue(rule, null);
 
                    IndentLevel--;
                    tree.Add(new CommonToken(Dedent));
                    return tree;
                }
                return new List<dynamic> { node };
            }
        };

        /// <summary>
        /// Build dedentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildDedent(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                IndentLevel--;
                return new List<dynamic> { node };
            }
        };

        /// <summary>
        /// Build brace dedentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildDedentBrace(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                List<dynamic> tree = new();
                IndentLevel--;

                tree.Add(new CommonToken(Dedent));
                tree.AddRange(BuildStartline(context, node).BuildParseTree());
                tree.Add(new CommonToken(Newline, Environment.NewLine));
                return tree;
            }
        };

        /// <summary>
        /// Build whitespace to the right and left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual ExtraNode BuildWhitespace(ParserRuleContext context, dynamic node,
            bool left, bool right) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                List<dynamic> tree = new();
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
