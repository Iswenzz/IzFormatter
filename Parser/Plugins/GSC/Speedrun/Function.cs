using System.Linq;
using System.Collections.Generic;

using Iswenzz.CoD4.Parser.Runtime;
using Iswenzz.CoD4.Parser.Utils;
using Iswenzz.CoD4.Parser.Plugins.GSC.Speedrun.Tasks;
using Iswenzz.CoD4.Parser.Recognizers.GSC;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Plugins.GSC.Speedrun
{
    /// <summary>
    /// Function definition.
    /// </summary>
    public class Function
    {
        public GSCRecognizer GSC { get; set; }
        public FunctionStatementContext Context { get; set; }

        public string Identifier { get; set; }
        public bool IsMain { get; set; }
        public bool IsTrap { get; set; }
        public bool IsTeleporter { get; set; }

        public List<IdentifierContext> Calls { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Function"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Function(GSCRecognizer gsc, FunctionStatementContext context)
        {
            GSC = gsc;
            Context = context;

            Identifier = Context.identifier().GetText();
            Calls = GetCalls();

            IsMain = Identifier.EqualsIgnoreCase("main");
            IsMain = Identifier.EqualsIgnoreCase("main");
            IsTrap = IsTrapFunction();
            IsTeleporter = IsTeleporterFunction();

            Remove.DangerousExpressions(GSC, Calls);
            Remove.SpeedrunUnnecessaryExpressions(GSC, Calls);
            if (IsMain)
            {
                Tasks.Main.AddSpeedrunWays(Context);
                Tasks.Main.AddSpeedrunSpawn(Context);
            }
            if (IsTrap) Trap.DisableTrigger(Context);
            if (IsTeleporter) Teleporter.RemoveDelays(GSC, Context);
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
            if (Context.RecurseChildsOfType<WaitStatementContext>() == null)
                return false;
            if (!Calls.Any(c => c.Identifier().GetText().EqualsIgnoreCase("setorigin")))
                return false;
            return true;
        }
    }
}
