using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;
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

        public override void ExitRule()
        {
            Console.WriteLine($"RULE: {Context.RuleIndex}");
            BuildRule(Context);
            base.ExitRule();
        }

        public virtual IEnumerable<IParseTree> GetChilds(IParseTree context)
        {
            for (int i = 0; i < context.ChildCount; i++)
                yield return context.GetChild(i);
        }

        public virtual void RemoveChilds(ParserRuleContext context)
        {
            for (int i = 0; i < context.ChildCount; i++)
                context.RemoveLastChild();
        }

        protected virtual void BuildRule(IParseTree context)
        {
            if (context.GetType().GetField("ws") != null && context is ParserRuleContext rule)
            {
                BuildWhitespace(rule);
                return;
            }
            for (int i = 0; i < context.ChildCount; i++)
                BuildRule(context.GetChild(i));
        }

        protected virtual void BuildWhitespace(ParserRuleContext context)
        {
            IParseTree ws = (IParseTree)context.GetType().GetField("ws").GetValue(context);
            List<IParseTree> childs = GetChilds(context).ToList();
            int needWhitespaceIndex = childs.IndexOf(ws);

            RemoveChilds(context);
            //for (int i = 0; i < 1; i++)
            {
                //    //if (i == needWhitespaceIndex)
                //    //{
                //context.AddChild(TokenFactory.Create(Whitespace, " "));
                //    //    context.AddChild((dynamic)ws);
                //    //    context.AddChild(TokenFactory.Create(Whitespace, " "));
                //    //}
                //    //else
                context.AddChild((RuleContext)childs[0]);
                //Console.WriteLine($"MDR: {i}");
            }
        }
    }
}
