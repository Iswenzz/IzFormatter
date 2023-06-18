using Antlr4.Runtime;

using IzFormatter.Engine.Utils;
using static GSCParser;

namespace IzFormatter.Engine.Recognizers.GSC.Refactor
{
    /// <summary>
    /// Comment refactoring.
    /// </summary>
    public class Comment
    {
        /// <summary>
        /// Build a line comment.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <returns></returns>
        public static void Line(ParserRuleContext context)
        {
            context.RemoveChilds();
            context.AddChild(new CommonToken(LineComment, $"// {context.GetText()}"));
        }

        /// <summary>
        /// Build a block comment.
        /// </summary>
        /// <param name="context">The context rule.</param>
        /// <returns></returns>
        public static void Block(ParserRuleContext context)
        {
            context.RemoveChilds();
            context.AddChild(new CommonToken(BlockComment, $"/* {context.GetText()} */"));
        }
    }
}
