using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Tree;
using Antlr4.Runtime.Misc;
using static GSCParser;
using Iswenzz.CoD4.Parser.Utils;

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
        /// Build rule with formatting.
        /// </summary>
        /// <param name="context">The rule context.</param>
        protected virtual void BuildRule(IParseTree context)
        {
            if (context is ParserRuleContext rule)
            {
                dynamic ws = context.GetType().GetField("ws")?.GetValue(context);
                if (ws != null)
                    BuildWhitespace(rule, ws);
            }
            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));
        }

        protected virtual void BuildWhitespace(ParserRuleContext context, dynamic ws)
        {
            List<IParseTree> childs = context.GetChilds().ToList();
            int needWhitespaceIndex = ParserUtils.IndexOfChild(childs, ws);

            if (childs.Any(c => c is ITerminalNode token && token.Symbol.Type == Whitespace))
                return;

            context.RemoveChilds();
            for (int i = 0; i < childs.Count; i++)
            {
                if (i == needWhitespaceIndex)
                {
                    context.AddChild(TokenFactory.Create(Whitespace, " "));
                    context.AddChild((dynamic)ws);
                    context.AddChild(TokenFactory.Create(Whitespace, " "));
                }
                else
                    context.AddChild((dynamic)childs.ElementAt(i));
            }
        }
    }
}
