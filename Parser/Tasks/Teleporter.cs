﻿using System.Linq;

using Iswenzz.CoD4.Parser.Recognizers;
using Iswenzz.CoD4.Parser.Runtime;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Tasks
{
    /// <summary>
    /// Teleporter behavior.
    /// </summary>
    public static class Teleporter
    {
        /// <summary>
        /// Remove the delays of a teleporter.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The teleporter function context.</param>
        public static void RemoveDelays(GSC gsc, FunctionStatementContext context)
        {
            var loop = context.RecurseChildsOfType<IterationStatementContext>().LastOrDefault();
            if (loop != null)
            {
                foreach (var wait in loop.RecurseChildsOfType<WaitExpressionContext>())
                    Comment.Line(gsc, wait);
            }
        }
    }
}
