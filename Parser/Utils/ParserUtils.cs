using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

namespace Iswenzz.CoD4.Parser.Utils
{
    /// <summary>
    /// Parser utility class.
    /// </summary>
    public static class ParserUtils
    {
        /// <summary>
        /// Get the source text from a <see cref="ParserRuleContext"/>.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <returns></returns>
        public static string SourceTextForContext(ParserRuleContext context)
        {
            ICharStream cs = context.Start.InputStream;
            int startIndex = context.Start.StartIndex;
            int stopIndex = context.Stop != null ? context.Stop.StopIndex : -1;
            return cs.GetText(new Interval(startIndex, stopIndex));
        }
    }
}
