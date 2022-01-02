using System;

using Iswenzz.CoD4.Parser.Utils;
using Iswenzz.CoD4.Parser.Grammar;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Tasks
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
            SimpleInputContext input = GSCRecognizer.ParseSimpleInput("level endon(\"trigger\");");
            CompoundStatementContext compound = context.compoundStatement();
            compound.AddChildAt(input.statement(), 1);
        }
    }
}
