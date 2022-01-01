using Antlr4.Runtime;

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
        public static void Line(ParserRuleContext context)
        {
            string content = $"// {context.GetText()}";
            context.RemoveChilds();
            context.AddChild(new CommonToken(LineComment, content));
        }

        /// <summary>
        /// Block comment the context.
        /// </summary>
        /// <param name="context">The context definition.</param>
        public static void Block(ParserRuleContext context)
        {
            string content = $"/* {context.GetText()} */";
            context.RemoveChilds();
            context.AddChild(new CommonToken(LineComment, content));
        }
    }
}
