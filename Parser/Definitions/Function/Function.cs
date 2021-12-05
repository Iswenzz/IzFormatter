using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// GSC function.
    /// </summary>
    public class Function
    {
        public FunctionDeclarationContext Context { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Function"/>.
        /// </summary>
        /// <param name="context">The function context.</param>
        public Function(FunctionDeclarationContext context)
        {
            Context = context;
        }
    }
}
