﻿using Antlr4.Runtime;

using Iswenzz.CoD4.Parser.Recognizers;
using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Tasks
{
    /// <summary>
    /// Comment tasks
    /// </summary>
    public static class Comment
    {
        /// <summary>
        /// Line comment the context.
        /// </summary>
        /// <param name="context">The context definition.</param>
        public static void Line(ParserRuleContext context) =>
            context.AddChildAt(new CommonToken(LineComment), 0);

        /// <summary>
        /// Block comment the context.
        /// </summary>
        /// <param name="context">The context definition.</param>
        public static void Block(ParserRuleContext context) =>
            context.AddChildAt(new CommonToken(BlockComment), 0);
    }
}
