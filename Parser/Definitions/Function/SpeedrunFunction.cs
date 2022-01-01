using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizer;
using Iswenzz.CoD4.Parser.Tasks.Function;
using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// Function declaration.
    /// </summary>
    public class SpeedrunFunction : Function
    {
        public bool IsMain { get; set; }

        /// <summary>
        /// Initialize a new <see cref="SpeedrunFunction"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public SpeedrunFunction(GSC gsc, ParserRuleContext context) : base(gsc, context) { }

        public override string VisitFunctionStatement([NotNull] FunctionStatementContext context)
        {
            IsMain = context.identifier().GetText().EqualsIgnoreCase("main");

            Remove.DangerousExpressions(context);
            Remove.SpeedrunUnnecessaryExpressions(context);
            return base.VisitFunctionStatement(context);
        }
    }
}
