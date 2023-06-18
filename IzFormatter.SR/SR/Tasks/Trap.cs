using IzFormatter.Engine.Recognizers.GSC;
using IzFormatter.Engine.Utils;
using static GSCParser;

namespace IzFormatter.SR.Tasks
{
    /// <summary>
    /// Deathrun traps.
    /// </summary>
    public static class Trap
    {
        /// <summary>
        /// Disable the trap trigger.
        /// </summary>
        /// <param name="context">The trap function context.</param>
        public static void DisableTrigger(FunctionStatementContext context)
        {
            string code = @"level endon(""trigger"");";
            SimpleInputContext input = GSCRecognizer.ParseSimpleInput(code);

            CompoundStatementContext compound = context.compoundStatement();
            compound.AddChildAt(1, input.statement());
        }
    }
}
