using Antlr4.Runtime;
using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// Definition base class.
    /// </summary>
    public class Definition : GSCBaseVisitor<int>
    {
        protected GSC GSC { get; set; }
        public ParserRuleContext Context { get; set; }

        /// <summary>
        /// Initialize a new <see cref="CompilationUnit"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Definition(GSC gsc, ParserRuleContext context)
        {
            GSC = gsc;
            Context = context;

            Visit(context);
        }
    }
}
