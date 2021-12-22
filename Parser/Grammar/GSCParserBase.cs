using System;
using System.IO;
using System.Collections;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using static GSCParser;
using System.Linq;

namespace Iswenzz.CoD4.Parser.Grammar
{
    public class GSCParserBase : Antlr4.Runtime.Parser
    {
        public GSCParserBase(ITokenStream input) : base(input) { }
        public GSCParserBase(ITokenStream input, TextWriter output, TextWriter errorOutput) 
            : base(input, output, errorOutput) { }

        public virtual int IndentLevel { get; set; }

        public override string[] RuleNames => throw new NotImplementedException();
        public override IVocabulary Vocabulary => throw new NotImplementedException();
        public override string GrammarFileName => throw new NotImplementedException();

        /// <summary>
        /// On exit rule.
        /// </summary>
        public override void ExitRule()
        {
            Console.WriteLine($"RULE: {Context.RuleIndex}");
            BuildRule(Context);
            base.ExitRule();
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
                dynamic newline = context.GetType().GetField("newline")?.GetValue(context);
                dynamic whitespace = context.GetType().GetField("ws")?.GetValue(context);
                dynamic whitespaceLeft = context.GetType().GetField("wsl")?.GetValue(context);
                dynamic whitespaceRight = context.GetType().GetField("wsr")?.GetValue(context);

                ExtraNode.Build(BuildIndent(rule, indent));
                ExtraNode.Build(BuildNewline(rule, newline));
                ExtraNode.Build(BuildWhitespace(rule, whitespace));
                ExtraNode.Build(BuildWhitespaceLeft(rule, whitespaceLeft));
                ExtraNode.Build(BuildWhitespaceRight(rule, whitespaceRight));
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
            RebuildCallback = () =>
            {
                string newLine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));

                return new ArrayList
                {
                    node,
                    TokenFactory.Create(Newline, newLine)
                };
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
            RebuildCallback = () =>
            {
                string newLine = Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));
                IndentLevel++;

                return new ArrayList
                {
                    TokenFactory.Create(Indent, newLine),
                    node
                };
            }
        };

        /// <summary>
        /// Build whitespace to the right and left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildWhitespace(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            CancelToken = Whitespace,
            RebuildCallback = () => new ArrayList
            {
                TokenFactory.Create(Whitespace, " "),
                node,
                TokenFactory.Create(Whitespace, " ")
            }
        };

        /// <summary>
        /// Build whitespace to the left.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildWhitespaceLeft(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            CancelToken = Whitespace,
            RebuildCallback = () => new ArrayList 
            {
                TokenFactory.Create(Whitespace, " "),
                node,
            },
        };

        /// <summary>
        /// Build whitespace to the right.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <param name="node">The node to apply.</param>
        /// <returns></returns>
        protected virtual ExtraNode BuildWhitespaceRight(ParserRuleContext context, dynamic node) => new(context)
        {
            Node = node,
            CancelToken = Whitespace,
            RebuildCallback = () => new ArrayList 
            {
                node,
                TokenFactory.Create(Whitespace, " ")
            },
        };
    }
}
