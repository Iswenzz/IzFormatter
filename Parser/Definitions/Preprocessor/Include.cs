using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Preprocessor
{
    /// <summary>
    /// Include preprocessor.
    /// </summary>
    public class Include
    {
        public DirectiveContext Context { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Include"/>.
        /// </summary>
        /// <param name="context">The directive context.</param>
        public Include(DirectiveContext context)
        {
            Context = context;
        }
    }
}
