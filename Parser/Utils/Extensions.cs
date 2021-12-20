using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Utils 
{
    /// <summary>
    /// Extension methods class.
    /// </summary>
    public static class Extensions
    {
        public delegate string VisitMethod<T>(T context);

        /// <summary>
        /// Compute the context in between.
        /// </summary>
        /// <param name="parentContext">The parent context.</param>
        /// <param name="betweenContext">The context to read in between.</param>
        /// <param name="indentBetween">Add an optional indentation before the between context.</param>
        /// <typeparam name="T">The context type to read in between.</typeparam>
        /// <returns></returns>
        public static string VisitBetweenRule<T>(this ParserRuleContext parentContext,
            T betweenContext, VisitMethod<T> visit, string indentBetween = null)
            where T : ParserRuleContext
        {
            string result = string.Empty;
            if (betweenContext == null)
                return result;

            for (int i = 0; i < parentContext.ChildCount; i++)
            {
                var child = parentContext.GetChild(i);
                if (betweenContext.SourceInterval.Equals(child.SourceInterval))
                    result += indentBetween + visit(betweenContext);
                else
                    result += child.GetText();
            }
            return result;
        }
    }
}
