using System;
using System.Linq;
using System.Text;
using System.Collections.Generic;

using Iswenzz.CoD4.Parser.Runtime;
using static GSCParser;

using Antlr4.Runtime.Tree;
using Antlr4.Runtime.Misc;
using Antlr4.Runtime;
using System.Data;

namespace Iswenzz.CoD4.Parser.Recognizers.GSC
{
    /// <summary>
    /// GSC Visitor.
    /// </summary>
    public class GSCFormatter : GSCParserBaseVisitor<string>
    {
        protected GSCRecognizer GSC { get; set; }
        protected int IndentLevel { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCFormatter"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        public GSCFormatter(GSCRecognizer gsc)
        {
            GSC = gsc;
        }

        /// <summary>
        /// Visit the tree.
        /// </summary>
        /// <param name="tree">The parse tree.</param>
        /// <returns></returns>
        public override string Visit(IParseTree tree)
        {
            base.Visit(tree);
            Format(tree);
            return tree.GetText();
        }

        /// <summary>
        /// Build rule and its childrens with formatting.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public virtual void Format(IParseTree context)
        {
            if (context is not ParserRuleContext rule)
                return;

            NodeBuilder.BuildVariables("T", rule, node => T(rule, node));
            NodeBuilder.BuildVariables("TNL", rule, node => TNL(rule, node));
            NodeBuilder.BuildVariables("NLT", rule, node => NLT(rule, node));
            NodeBuilder.BuildVariables("NL", rule, node => NL(rule, node));
            NodeBuilder.BuildVariables("ID", rule, node => ID(rule, node));
            NodeBuilder.BuildVariables("IDT", rule, node => IDT(rule, node));
            NodeBuilder.BuildVariables("IDDD", rule, node => IDDD(rule, node));
            NodeBuilder.BuildVariables("WS", rule, node => WS(rule, node, true, true));
            NodeBuilder.BuildVariables("WSL", rule, node => WS(rule, node, true, false));
            NodeBuilder.BuildVariables("WSR", rule, node => WS(rule, node, false, true));

            for (int i = 0; i < context.ChildCount; i++)
                Format(context.GetChild(i));

            NodeBuilder.BuildVariables("DD", rule, node => DD(rule, node));
            NodeBuilder.BuildVariables("DDT", rule, node => DDT(rule, node));
            NodeBuilder.BuildVariables("CL", rule, node => C(rule, node, LineComment));
            NodeBuilder.BuildVariables("CB", rule, node => C(rule, node, BlockComment));
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
                return new List<dynamic> 
                { 
                    new CommonToken(Indent), 
                    node 
                };
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
                List<dynamic> tree = new()
                {
                    new CommonToken(Indent),
                    new CommonToken(Newline, Environment.NewLine)
                };
                tree.AddRange(T(context, node).BuildParseTree());
                tree.Add(new CommonToken(Newline, Environment.NewLine));
                IndentLevel++;
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
                    rule.ReflectRuleField("T")?.SetValue(rule, null);

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
                return new List<dynamic> 
                { 
                    new CommonToken(Dedent), 
                    node 
                };
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
                if (true) // If not last statement of parent ?
                {
                    tree.Add(new CommonToken(Newline, Environment.NewLine));
                    tree.Add(new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))));
                }
                return tree;
            }
        };

        /// <summary>
        /// Build whitespace to the right and left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual NodeBuilder WS(ParserRuleContext context, dynamic node, bool left, bool right) => new(context)
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
