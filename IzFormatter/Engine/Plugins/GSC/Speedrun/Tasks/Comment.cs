using Antlr4.Runtime;

using IzFormatter.Engine.Runtime;
using IzFormatter.Engine.Recognizers.GSC;
using static GSCParser;

namespace IzFormatter.Engine.Plugins.GSC.Speedrun.Tasks
{
    /// <summary>
    /// Comment tasks
    /// </summary>
    public static class Comment
    {
        /// <summary>
        /// Line comment the context.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The context definition.</param>
        public static void Line(GSCRecognizer gsc, ParserRuleContext context)
        {
            gsc.Formatter.Format(context);
            NodeBuilder comment = gsc.Formatter.C((ParserRuleContext)context.Parent, context, LineComment);
            NodeBuilder.Build(comment);
        }

        /// <summary>
        /// Block comment the context.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The context definition.</param>
        public static void Block(GSCRecognizer gsc, ParserRuleContext context)
        {
            gsc.Formatter.Format(context);
            NodeBuilder comment = gsc.Formatter.C((ParserRuleContext)context.Parent, context, BlockComment);
            NodeBuilder.Build(comment);
        }
    }
}
