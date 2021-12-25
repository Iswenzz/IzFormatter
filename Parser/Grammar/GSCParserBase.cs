using System;
using System.IO;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Grammar
{
    public class GSCParserBase : Antlr4.Runtime.Parser
    {
        public GSCParserBase(ITokenStream input) : base(input) { }
        public GSCParserBase(ITokenStream input, TextWriter output, TextWriter errorOutput)
            : base(input, output, errorOutput) { }

        public virtual List<ParserRuleContext> Rules { get; set; } = new();
        public virtual int IndentLevel { get; set; }

        public override string[] RuleNames => throw new NotImplementedException();
        public override IVocabulary Vocabulary => throw new NotImplementedException();
        public override string GrammarFileName => throw new NotImplementedException();

        /// <summary>
        /// On exit rule.
        /// </summary>
        public override void ExitRule()
        {
            Rules.Add(Context);
            base.ExitRule();
        }

        /// <summary>
        /// Build the code formatting.
        /// </summary>
        public virtual void BuildFormatting()
        {
            Rules.Reverse();
            foreach (ParserRuleContext rule in Rules)
                BuildRule(rule);
        }

        /// <summary>
        /// Build rule and its childrens with formatting.
        /// </summary>
        /// <param name="context">The rule context.</param>
        protected virtual void BuildRule(IParseTree context)
        {
            if (context is ParserRuleContext rule)
            {
                dynamic indent = context.GetType().GetField("indent")?.GetValue(context);
                dynamic dedent = context.GetType().GetField("dedent")?.GetValue(context);
                dynamic newline = context.GetType().GetField("newline")?.GetValue(context);
                dynamic whitespace = context.GetType().GetField("ws")?.GetValue(context);
                dynamic whitespaceLeft = context.GetType().GetField("wsl")?.GetValue(context);
                dynamic whitespaceRight = context.GetType().GetField("wsr")?.GetValue(context);

                ExtraNode.Build(BuildIndent(rule, indent));
                ExtraNode.Build(BuildNewline(rule, newline));
                ExtraNode.Build(BuildWhitespace(rule, whitespace, true, true));
                ExtraNode.Build(BuildWhitespace(rule, whitespaceLeft, true, false));
                ExtraNode.Build(BuildWhitespace(rule, whitespaceRight, false, true));
            }
            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));
        }

        /// <summary>
        /// Build a new line with indentation.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildNewline(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            CancelToken = Newline,
            BuildParseTree = () => new ArrayList
            {
                node,
                TokenFactory.Create(Newline, Environment.NewLine + 
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
            CancelToken = Indent,
            BuildParseTree = () =>
            {
                string newLine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));
                IndentLevel++;

                ArrayList tree = new();
                tree.Add(TokenFactory.Create(Indent, newLine));
                tree.AddRange(BuildNewline(context, node).BuildParseTree());
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
            CancelToken = Dedent,
            BuildParseTree = () =>
            {
                IndentLevel--;
                string newLine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));

                // var last = (ParserRuleContext)context.GetLastChildRecursion().Parent;
                // last.RemoveLastChild();
                // System.Console.WriteLine($"{last.ChildCount}[{last.GetText()}]");

                return new ArrayList
                {
                    TokenFactory.Create(Dedent, ""),
                    node,
                    TokenFactory.Create(Newline, newLine),
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
            CancelToken = Whitespace,
            BuildParseTree = () => 
            {
                ArrayList tree = new();
                if (left) tree.Add(TokenFactory.Create(Whitespace, " "));
                tree.Add(node);
                if (right) tree.Add(TokenFactory.Create(Whitespace, " "));
                return tree;
            }
        };
    }
}
