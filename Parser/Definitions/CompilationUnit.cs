using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// GSC compilation unit.
    /// </summary>
    public class CompilationUnit : Definition
    {
        /// <summary>
        /// Initialize a new <see cref="CompilationUnit"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public CompilationUnit(GSC gsc, ParserRuleContext context) : base(gsc, context) { }

        /// <summary>
        /// Function declaration.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override int VisitFunctionDeclaration([NotNull] GSCParser.FunctionDeclarationContext context)
        {
            GSC.CreateFunction(context);
            return base.VisitFunctionDeclaration(context);
        }

        /// <summary>
        /// Directive.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override int VisitDirective([NotNull] GSCParser.DirectiveContext context)
        {
            GSC.CreateInclude(context);
            return base.VisitDirective(context);
        }
    }
}
