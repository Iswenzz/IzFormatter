using System;
using System.Linq;
using System.Collections.Generic;

using Antlr4.Runtime.Tree;
using Antlr4.Runtime;

using IzFormatter.Engine.Utils;
using IzFormatter.Engine.Runtime.Stream;
using static GSCParser;

namespace IzFormatter.Engine.Recognizers.GSC.Formatter
{
    /// <summary>
    /// GSC Visitor.
    /// </summary>
    public class GSCFormatter : GSCParserBaseVisitor<string>
    {
        public int IndentLevel { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCFormatter"/>.
        /// </summary>
        public GSCFormatter() { }

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

            NodeBuilder.BuildVariables("E", rule, node => E(rule, node));
            NodeBuilder.BuildVariables("T", rule, node => T(rule, node));
            NodeBuilder.BuildVariables("TNL", rule, node => TNL(rule, node));
            NodeBuilder.BuildVariables("NLT", rule, node => NLT(rule, node));
            NodeBuilder.BuildVariables("NL", rule, node => NL(rule, node));
            NodeBuilder.BuildVariables("ID", rule, node => ID(rule, node));
            NodeBuilder.BuildVariables("IDT", rule, node => IDT(rule, node));
            NodeBuilder.BuildVariables("IDB", rule, node => IDB(rule, node));
            NodeBuilder.BuildVariables("IDS", rule, node => IDS(rule, node));
            NodeBuilder.BuildVariables("IDDD", rule, node => IDDD(rule, node));
            NodeBuilder.BuildVariables("WS", rule, node => WS(rule, node, true, true));
            NodeBuilder.BuildVariables("WSL", rule, node => WS(rule, node, true, false));
            NodeBuilder.BuildVariables("WSR", rule, node => WS(rule, node, false, true));

            for (int i = 0; i < context.ChildCount; i++)
                Format(context.GetChild(i));

            NodeBuilder.BuildVariables("DD", rule, node => DD(rule, node));
            NodeBuilder.BuildVariables("DDT", rule, node => DDT(rule, node));
            NodeBuilder.BuildVariables("DDB", rule, node => DDB(rule, node));
        }

        /// <summary>
        /// Build a start line with indentation whitespaces and a new line.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> TNL(ParserRuleContext context, object node) => new()
        {
            new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))),
            node,
            new CommonToken(Newline, Environment.NewLine),
        };

        /// <summary>
        /// Build a new line with indentation whitespaces.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> NLT(ParserRuleContext context, object node) => new()
        {
            new CommonToken(Newline, Environment.NewLine),
            new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))),
            node,
        };

        /// <summary>
        /// Build a start line with indentation whitespaces.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> T(ParserRuleContext context, object node) => new()
        {
            new CommonToken(Whitespace, string.Concat(Enumerable.Repeat('\t', IndentLevel))),
            node,
        };

        /// <summary>
        /// Build a new line.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> NL(ParserRuleContext context, object node) => new()
        {
            node,
            new CommonToken(Newline, Environment.NewLine)
        };

        /// <summary>
        /// Build indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> ID(ParserRuleContext context, object node)
        {
            IndentLevel++;
            return new()
            {
                new CommonToken(Indent),
                node
            };
        }

        /// <summary>
        /// Build indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> IDS(ParserRuleContext context, object node)
        {
            List<object> tree = new()
            {
                new CommonToken(Indent)
            };
            tree.AddRange(T(context, node));
            tree.Add(new CommonToken(Newline, Environment.NewLine));
            IndentLevel++;
            return tree;
        }

        /// <summary>
        /// Build indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> IDB(ParserRuleContext context, object node)
        {
            List<object> tree = new()
            {
                new CommonToken(Indent),
                new CommonToken(Newline, Environment.NewLine)
            };
            tree.AddRange(T(context, node));
            tree.Add(new CommonToken(Newline, Environment.NewLine));
            IndentLevel++;
            return tree;
        }

        /// <summary>
        /// Build indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> IDT(ParserRuleContext context, object node)
        {
            List<object> tree = new()
            {
                new CommonToken(Indent),
                new CommonToken(Newline, Environment.NewLine)
            };
            IndentLevel++;
            tree.AddRange(T(context, node));
            tree.Add(new CommonToken(Newline, Environment.NewLine));
            return tree;
        }

        /// <summary>
        /// Build indentation for a short statement.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> IDDD(ParserRuleContext context, object node)
        {
            List<object> tree = new();
            if (node is ParserRuleContext rule && rule.LastChildOfType<CompoundStatementContext>() == null)
            {
                IndentLevel++;
                tree.Add(new CommonToken(Newline, Environment.NewLine));
                tree.Add(new CommonToken(Indent));
                tree.AddRange(T(context, node));

                IndentLevel--;
                tree.Add(new CommonToken(Dedent));
                return tree;
            }
            tree.Add(node);
            return tree;
        }

        /// <summary>
        /// Build dedentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> DD(ParserRuleContext context, object node)
        {
            IndentLevel--;
            return new()
            {
                new CommonToken(Dedent),
                node
            };
        }

        /// <summary>
        /// Build dedentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> DDB(ParserRuleContext context, object node)
        {
            List<object> tree = new()
            {
                new CommonToken(Dedent)
            };
            IndentLevel--;
            tree.AddRange(T(context, node));
            return tree;
        }

        /// <summary>
        /// Build dedentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> DDT(ParserRuleContext context, object node)
        {
            List<object> tree = new()
            {
                new CommonToken(Dedent)
            };
            tree.AddRange(T(context, node));
            IndentLevel--;
            return tree;
        }

        /// <summary>
        /// Build whitespace to the right and left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> WS(ParserRuleContext context, object node, bool left, bool right)
        {
            List<object> tree = new();
            if (left) tree.Add(new CommonToken(Whitespace, " "));
            tree.Add(node);
            if (right) tree.Add(new CommonToken(Whitespace, " "));
            return tree;
        }

        /// <summary>
        /// Build EOF.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        public virtual List<object> E(ParserRuleContext context, object node) => new()
        {
            new CommonToken(GSCParser.Eof, "")
        };
    }
}
