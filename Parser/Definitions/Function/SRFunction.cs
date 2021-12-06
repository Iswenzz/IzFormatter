using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// Function declaration.
    /// </summary>
    public class SRFunction : Function
    {
        /// <summary>
        /// Initialize a new <see cref="SRFunction"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public SRFunction(GSC gsc, ParserRuleContext context) : base(gsc, context) { }

        /// <summary>
        /// Iteration statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override int VisitIterationStatement([NotNull] GSCParser.IterationStatementContext context)
        {
            System.Console.WriteLine("Iteration");
            return base.VisitIterationStatement(context);
        }
    }
}
