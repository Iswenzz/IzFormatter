using IzFormatter.Engine.Recognizers.GSC.Refactor;
using IzFormatter.Engine.Utils;
using static GSCParser;

namespace IzFormatter.SR.Tasks
{
    /// <summary>
    /// Teleporter behavior.
    /// </summary>
    public static class Teleporter
    {
        /// <summary>
        /// Remove the delays of a teleporter.
        /// </summary>
        /// <param name="context">The teleporter function context.</param>
        public static void RemoveDelays(FunctionStatementContext context)
        {
            var loop = context.RecurseChildsOfType<IterationStatementContext>().LastOrDefault();
            if (loop != null)
            {
                foreach (var wait in loop.RecurseChildsOfType<WaitExpressionContext>())
                    Comment.Line(wait);
            }
        }
    }
}
