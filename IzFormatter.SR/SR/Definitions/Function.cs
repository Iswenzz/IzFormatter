using IzFormatter.SR.Tasks;
using IzFormatter.Engine.Utils;
using IzFormatter.Engine.Runtime.Base;
using static GSCParser;

namespace IzFormatter.SR.Definitions
{
    /// <summary>
    /// Function definition.
    /// </summary>
    public class Function : Definition<FunctionStatementContext>
    {
        public string Identifier { get; set; }
        public bool IsMain { get; set; }
        public bool IsTrap { get; set; }
        public bool IsTeleporter { get; set; }

        public List<IdentifierContext> Calls { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Function"/>.
        /// </summary>
        /// <param name="context">The definition context.</param>
        public Function(FunctionStatementContext context)
        {
            Context = context;

            Identifier = Context.identifier().GetText();
            Calls = GetCalls();

            IsMain = Identifier.EqualsIgnoreCase("main");
            IsMain = Identifier.EqualsIgnoreCase("main");
            IsTrap = IsTrapFunction();
            IsTeleporter = IsTeleporterFunction();

            Remove.DangerousExpressions(Calls);
            Remove.SpeedrunUnnecessaryExpressions(Calls);
            if (IsMain)
            {
                Main.AddSpeedrunWays(Context);
                Main.AddSpeedrunSpawn(Context);
            }
            if (IsTrap) Trap.DisableTrigger(Context);
            if (IsTeleporter) Teleporter.RemoveDelays(Context);
        }

        /// <summary>
        /// Get all calls.
        /// </summary>
        /// <returns></returns>
        public virtual List<IdentifierContext> GetCalls() => Context
            .RecurseChildsOfType<FunctionExpressionContext>()
            .Select(call => call.RecurseChildsOfType<IdentifierContext>().FirstOrDefault())
            .ToList();

        /// <summary>
        /// Check if the function is a trap.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsTrapFunction()
        {
            if (!Identifier.ContainsIgnoreCase("trap"))
                return false;
            if (!Calls.Any(c => c.Identifier().GetText().EqualsIgnoreCase("waittill")))
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
            if (Context.RecurseChildsOfType<WaitExpressionContext>() == null)
                return false;
            if (!Calls.Any(c => c.Identifier().GetText().EqualsIgnoreCase("setorigin")))
                return false;
            return true;
        }
    }
}
