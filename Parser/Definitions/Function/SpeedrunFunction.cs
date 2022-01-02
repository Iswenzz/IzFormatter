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
        public bool IsTeleporter { get; set; }

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
            Identifier = Context.identifier().GetText();
            FunctionCallIdentifiers = GetAllFunctionCallIdentifiers();

            IsMain = Identifier.EqualsIgnoreCase("main");
            IsTrap = IsTrapFunction();
            IsTeleporter = IsTeleporterFunction();

            Remove.DangerousExpressions(FunctionCallIdentifiers);
            Remove.SpeedrunUnnecessaryExpressions(FunctionCallIdentifiers);
            if (IsMain)
            {
                Main.AddSpeedrunWays(Context);
                Main.AddSpeedrunSpawn(Context);
            }
            if (IsTrap) Trap.DisableTrigger(Context);
            if (IsTeleporter) Teleporter.RemoveDelays(Context);

            base.Construct();
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
            if (!Identifier.ContainsIgnoreCase("trap"))
                return false;
            if (!FunctionCallIdentifiers.Any(c => c.Identifier().GetText().EqualsIgnoreCase("waittill")))
                return false;
            return true;
        }

        /// <summary>
        /// Check if the function is a teleporter.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsTeleporterFunction()
        {
            if (Context.RecurseChildsOfType<IterationStatementContext>() == null)
                return false;
            if (Context.RecurseChildsOfType<WaitStatementContext>() == null)
                return false;
            if (!FunctionCallIdentifiers.Any(c => c.Identifier().GetText().EqualsIgnoreCase("setorigin")))
                return false;
            return true;
        }
    }
}
