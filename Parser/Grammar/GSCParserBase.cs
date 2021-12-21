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
                dynamic whitespace = context.GetType().GetField("ws")?.GetValue(context);
                dynamic whitespaceLeft = context.GetType().GetField("wsl")?.GetValue(context);
                dynamic whitespaceRight = context.GetType().GetField("wsr")?.GetValue(context);

                ExtraNode.Build(BuildWhitespace(rule, whitespace, Whitespace));
                ExtraNode.Build(BuildWhitespaceLeft(rule, whitespaceLeft, Whitespace));
                ExtraNode.Build(BuildWhitespaceRight(rule, whitespaceRight, Whitespace));
            }
            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));
        }

        protected virtual ExtraNode BuildWhitespace(ParserRuleContext context, dynamic node, int nodeType) => new(context)
        {
            Node = node,
            CancelToken = nodeType,
            RebuildTree = new ArrayList {
                TokenFactory.Create(Whitespace, " "),
                node,
                TokenFactory.Create(Whitespace, " ")
            },
        };

        protected virtual ExtraNode BuildWhitespaceLeft(ParserRuleContext context, dynamic node, int nodeType) => new(context)
        {
            Node = node,
            CancelToken = nodeType,
            RebuildTree = new ArrayList {
                TokenFactory.Create(Whitespace, " "),
                node,
            },
        };

        protected virtual ExtraNode BuildWhitespaceRight(ParserRuleContext context, dynamic node, int nodeType) => new(context)
        {
            Node = node,
            CancelToken = nodeType,
            RebuildTree = new ArrayList {
                node,
                TokenFactory.Create(Whitespace, " ")
            },
        };
    }
}
