using System;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizers;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// GSC Speedrun compilation unit.
    /// </summary>
    public class SpeedrunCompilationUnit : CompilationUnit
    {
        /// <summary>
        /// Initialize a new <see cref="SpeedrunCompilationUnit"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public SpeedrunCompilationUnit(GSC gsc, CompilationUnitContext context) : base(gsc, context) { } 

        /// <summary>
        /// Function statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override string VisitFunctionStatement([NotNull] FunctionStatementContext context)
        {
            GSC.Stream.Append(new SpeedrunFunction(GSC, context).Stream + Environment.NewLine);
            return null;
        }
    }
}
