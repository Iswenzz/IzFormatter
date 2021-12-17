using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizer;
using static GSCParser;

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
        /// Function statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override string VisitFunctionStatement([NotNull] FunctionStatementContext context)
        {
            GSC.CreateFunction(context);
            return null;
        }

        /// <summary>
        /// Directive statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override string VisitDirectiveStatement([NotNull] DirectiveStatementContext context)
        {
            GSC.CreateInclude(context);
            return null;
        }
    }
}
