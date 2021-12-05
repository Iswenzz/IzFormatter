using System;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Utils;

namespace Iswenzz.CoD4.Parser.Listeners
{
    /// <summary>
    /// GSC ANTLRv4 listener.
    /// </summary>
    public class GSCListener : GSCBaseListener
    {
        public override void EnterFunctionDeclaration([NotNull] GSCParser.FunctionDeclarationContext context)
        {
            //Console.WriteLine(ParserUtils.SourceTextForContext(context));
        }

        public override void EnterDirective([NotNull] GSCParser.DirectiveContext context)
        {
            Console.WriteLine(ParserUtils.SourceTextForContext(context));
        }
    }
}
