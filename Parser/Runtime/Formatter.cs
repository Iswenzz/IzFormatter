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

            NodeBuilder.ReflectBuildMany("T", rule, node => T(rule, node));
            NodeBuilder.ReflectBuildMany("TNL", rule, node => TNL(rule, node));
            NodeBuilder.ReflectBuildMany("NLT", rule, node => NLT(rule, node));
            NodeBuilder.ReflectBuildMany("NL", rule, node => NL(rule, node));
            NodeBuilder.ReflectBuildMany("ID", rule, node => ID(rule, node));
            NodeBuilder.ReflectBuildMany("IDT", rule, node => IDT(rule, node));
            NodeBuilder.ReflectBuildMany("IDDD", rule, node => IDDD(rule, node));
            NodeBuilder.ReflectBuildMany("WS", rule, node => WS(rule, node, true, true));
            NodeBuilder.ReflectBuildMany("WSL", rule, node => WS(rule, node, true, false));
            NodeBuilder.ReflectBuildMany("WSR", rule, node => WS(rule, node, false, true));

            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));

            NodeBuilder.ReflectBuildMany("DD", rule, node => DD(rule, node));
            NodeBuilder.ReflectBuildMany("DDT", rule, node => DDT(rule, node));
            NodeBuilder.ReflectBuildMany("CL", rule, node => C(rule, node, LineComment));
            NodeBuilder.ReflectBuildMany("CB", rule, node => C(rule, node, BlockComment));
        }

        /// <summary>
        /// Build a comment.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <param name="type">The type of comment.</param>
        /// <returns></returns>
        public virtual NodeBuilder C(ParserRuleContext context, dynamic node, int type) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                if (node is ParserRuleContext nodeContext)
                {
                    string content = type switch
                    {
                        LineComment => $"// {nodeContext.GetText()}",
                        BlockComment => $"/* {nodeContext.GetText().Trim()} */",
                        _ => throw new NotImplementedException()
                    };

                    nodeContext.RemoveChilds();
                    nodeContext.AddChild(new CommonToken(type, content));
                }
                return new List<dynamic> { node };
            }
        };

        /// <summary>
        /// Build a start line with indentation whitespaces and a new line.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual NodeBuilder TNL(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () => new List<dynamic>
            {
                new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))),
                node,
                new CommonToken(Newline, Environment.NewLine),
            }
        };

        /// <summary>
        /// Build a new line with indentation whitespaces.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual NodeBuilder NLT(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () => new List<dynamic>
            {
                new CommonToken(Newline, Environment.NewLine),
                new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))),
                node,
            }
        };

        /// <summary>
        /// Build a start line with indentation whitespaces.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual NodeBuilder T(ParserRuleContext context, dynamic node) => new(context)
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
        public virtual NodeBuilder NL(ParserRuleContext context, dynamic node) => new(context)
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
        public virtual NodeBuilder ID(ParserRuleContext context, dynamic node) => new(context)
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
        public virtual NodeBuilder IDT(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                List<dynamic> tree = new();
                tree.Add(new CommonToken(Indent));
                tree.Add(new CommonToken(Newline, Environment.NewLine));
                tree.AddRange(T(context, node).BuildParseTree());
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
        public virtual NodeBuilder IDDD(ParserRuleContext context, dynamic node) => new(context)
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
                    tree.AddRange(T(context, node).BuildParseTree());
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
        public virtual NodeBuilder DD(ParserRuleContext context, dynamic node) => new(context)
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
        public virtual NodeBuilder DDT(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            BuildParseTree = () =>
            {
                List<dynamic> tree = new();
                IndentLevel--;

                tree.Add(new CommonToken(Dedent));
                tree.AddRange(T(context, node).BuildParseTree());
                return tree;
            }
        };

        /// <summary>
        /// Build whitespace to the right and left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual NodeBuilder WS(ParserRuleContext context, dynamic node,
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
    }
}
