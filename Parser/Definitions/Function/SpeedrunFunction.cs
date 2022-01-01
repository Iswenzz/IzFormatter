using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizer;
using Iswenzz.CoD4.Parser.Tasks;
using Iswenzz.CoD4.Parser.Tasks.Function;
using Iswenzz.CoD4.Parser.Utils;
using System.Collections.Generic;
using System.Linq;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// SR Speedrun function statement.
    /// </summary>
    public class SpeedrunFunction : Function
    {
        public bool IsTrap { get; set; }
        public IEnumerable<IdentifierContext> FunctionCallIdentifiers { get; set; }

        /// <summary>
        /// Initialize a new <see cref="SpeedrunFunction"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public SpeedrunFunction(GSC gsc, FunctionStatementContext context) : base(gsc, context) { }

        /// <summary>
        /// Construct additional data before visiting the context.
        /// </summary>
        public override void Construct()
        {
            base.Construct();

            IsTrap = IsTrapFunction();
            FunctionCallIdentifiers = GetAllFunctionCallIdentifiers();

            Remove.DangerousExpressions(FunctionCallIdentifiers);
            Remove.SpeedrunUnnecessaryExpressions(FunctionCallIdentifiers);
            if (IsTrap) Trap.DisableTrigger(Context);
        }

        /// <summary>
        /// Get all function call identifiers.
        /// </summary>
        /// <returns></returns>
        public virtual IEnumerable<IdentifierContext> GetAllFunctionCallIdentifiers() => Context
            .RecurseChildsOfType<FunctionExpressionContext>()
            .Select(call => call.RecurseChildsOfType<IdentifierContext>().FirstOrDefault());

        /// <summary>
        /// Check if the function is a trap.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsTrapFunction()
        {
            if (!Context.identifier().GetText().ContainsIgnoreCase("trap"))
                return false;
            return false;
        }
    }
}
