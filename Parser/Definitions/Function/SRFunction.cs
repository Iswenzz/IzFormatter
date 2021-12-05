using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions.Function
{
    /// <summary>
    /// SR function with specific rules.
    /// </summary>
    public class SRFunction : Function
    {
        /// <summary>
        /// Initialize a new <see cref="SRFunction"/>.
        /// </summary>
        /// <param name="context">The function context.</param>
        public SRFunction(FunctionDeclarationContext context) : base(context) { }

        /// <summary>
        /// Process the definition.
        /// </summary>
        public override void Process()
        {
            System.Console.WriteLine("SR FUNCTION");
        }
    }
}
