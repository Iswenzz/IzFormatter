using Iswenzz.CoD4.Parser.Definitions.Function;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Recognizer
{
    /// <summary>
    /// SR Speedrun <see cref="GSC"/> file.
    /// </summary>
    public class SR : GSC
    {
        /// <summary>
        /// Initialize a new <see cref="SR"/> <see cref="GSC"/> file.
        /// </summary>
        /// <param name="filepath">The <see cref="GSC"/> file path.</param>
        public SR(string filepath) : base(filepath) { }

        /// <summary>
        /// Create a function.
        /// </summary>
        /// <param name="context">The definition context.</param>
        public override void CreateFunction(FunctionDeclarationContext context) =>
            Functions.Add(new SRFunction(this, context));
    }
}
