using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizer;
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

            IsTrap = IsTrapFunction();

            Remove.DangerousExpressions(Context);
            Remove.SpeedrunUnnecessaryExpressions(Context);
            if (IsTrap) Trap.DisableTrigger(Context);
        }

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
