using Antlr4.Runtime.Misc;

using IzFormatter.SR.Definitions;
using static GSCParser;

namespace IzFormatter.SR
{
    /// <summary>
    /// SR Visitor.
    /// </summary>
    public class Visitor : GSCParserBaseVisitor<string>
    {
        /// <summary>
        /// Visit function statement.
        /// </summary>
        /// <param name="context">The function context.</param>
        /// <returns></returns>
        public override string VisitFunctionStatement([NotNull] FunctionStatementContext context)
        {
            base.VisitFunctionStatement(context);
            return new Function(context).GetText();
        }
    }
}
