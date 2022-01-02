using System.Linq;
using System.Collections.Generic;

using Iswenzz.CoD4.Parser.Recognizers;
using Iswenzz.CoD4.Parser.Tasks;
using Iswenzz.CoD4.Parser.Tasks.Function;
using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// SR Speedrun function statement.
    /// </summary>
    public class SpeedrunFunction : Function
    {
        public IEnumerable<IdentifierContext> FunctionCallIdentifiers { get; set; }
        public bool IsTrap { get; set; }

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

            FunctionCallIdentifiers = GetAllFunctionCallIdentifiers();
            IsTrap = IsTrapFunction();

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
            if (!FunctionCallIdentifiers.Any(c => c.Identifier().GetText().EqualsIgnoreCase("waittill")))
                return false;
            return true;
        }
    }
}
