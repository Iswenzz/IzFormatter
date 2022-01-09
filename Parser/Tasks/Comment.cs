using Antlr4.Runtime;

using Iswenzz.CoD4.Parser.Recognizers;
using Iswenzz.CoD4.Parser.Runtime;
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
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The context definition.</param>
        public static void Line(GSC gsc, ParserRuleContext context)
        {
            gsc.Recognizer.Formatter.BuildRule(context);
            ExtraNode comment = gsc.Recognizer.Formatter.BuildComment(
                (ParserRuleContext)context.Parent, context, LineComment);
            ExtraNode.Build(comment);
        }

        /// <summary>
        /// Block comment the context.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The context definition.</param>
        public static void Block(GSC gsc, ParserRuleContext context)
        {
            gsc.Recognizer.Formatter.BuildRule(context);
            ExtraNode comment = gsc.Recognizer.Formatter.BuildComment(
                (ParserRuleContext)context.Parent, context, BlockComment);
            ExtraNode.Build(comment);
        }
    }
}
