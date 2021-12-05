﻿using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Definitions.Function;
using Iswenzz.CoD4.Parser.Definitions.Preprocessor;
using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Listeners
{
    /// <summary>
    /// GSC ANTLRv4 listener.
    /// </summary>
    public class GSCListener : GSCBaseListener
    {
        public GSC GSC { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCListener"/>.
        /// </summary>
        public GSCListener(GSC gsc) =>
            GSC = gsc;

        /// <summary>
        /// Enter function declaration.
        /// </summary>
        /// <param name="context">Function context.</param>
        public override void EnterFunctionDeclaration([NotNull] GSCParser.FunctionDeclarationContext context) =>
            GSC.Functions.Add(new Function(context));

        /// <summary>
        /// Enter directive.
        /// </summary>
        /// <param name="context">Directive context.</param>
        public override void EnterDirective([NotNull] GSCParser.DirectiveContext context) =>
            GSC.Includes.Add(new Include(context));
    }
}
