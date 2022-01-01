using Iswenzz.CoD4.Parser.Recognizer;
using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// Function statement.
    /// </summary>
    public class Function : Definition<FunctionStatementContext>
    {
        public bool IsMain { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Function"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Function(GSC gsc, FunctionStatementContext context) : base(gsc, context) { }

        /// <summary>
        /// Construct additional data before visiting the context.
        /// </summary>
        public override void Construct()
        {
            base.Construct();
            IsMain = Context.identifier().GetText().EqualsIgnoreCase("main");
        }
    }
}
