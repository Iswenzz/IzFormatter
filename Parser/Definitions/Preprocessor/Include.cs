using Antlr4.Runtime;

using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Definitions.Preprocessor
{
    /// <summary>
    /// Include directive.
    /// </summary>
    public class Include : Definition
    {
        /// <summary>
        /// Initialize a new <see cref="Include"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Include(GSC gsc, ParserRuleContext context) : base(gsc, context) { }
    }
}
