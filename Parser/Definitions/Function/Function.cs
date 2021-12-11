using Antlr4.Runtime;
using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// Function declaration.
    /// </summary>
    public class Function : Definition
    {
        /// <summary>
        /// Initialize a new <see cref="Function"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Function(GSC gsc, ParserRuleContext context) : base(gsc, context) { }
    }
}
