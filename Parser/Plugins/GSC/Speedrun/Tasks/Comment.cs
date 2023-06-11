using Iswenzz.CoD4.Parser.Runtime;
using Iswenzz.CoD4.Parser.Recognizers.GSC;
using static GSCParser;

using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Plugins.GSC.Speedrun.Tasks
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
            //gsc.Formatter.BaseFormatter.BuildRule(context);
            //NodeBuilder comment = gsc.Formatter.BaseFormatter.C(
            //    (ParserRuleContext)context.Parent, context, LineComment);
            //NodeBuilder.Build(comment);
        }

        /// <summary>
        /// Block comment the context.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The context definition.</param>
        public static void Block(GSCRecognizer gsc, ParserRuleContext context)
        {
            //gsc.Formatter.BaseFormatter.BuildRule(context);
            //NodeBuilder comment = gsc.Formatter.BaseFormatter.C(
            //    (ParserRuleContext)context.Parent, context, BlockComment);
            //NodeBuilder.Build(comment);
        }
    }
}
