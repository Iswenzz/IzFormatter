using Iswenzz.CoD4.Parser.Definitions.Function;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Recognizer
{
    /// <summary>
    /// SR Speedrun <see cref="GSC"/> file.
    /// </summary>
    public class Speedrun : GSC
    {
        /// <summary>
        /// Initialize a new <see cref="Speedrun"/> <see cref="GSC"/> file.
        /// </summary>
        /// <param name="filepath">The <see cref="GSC"/> file path.</param>
        public Speedrun(string filepath) : base(filepath) { }

        /// <summary>
        /// Create a function.
        /// </summary>
        /// <param name="context">The definition context.</param>
        public override void CreateFunction(FunctionStatementContext context) =>
            Functions.Add(new SpeedrunFunction(this, context));
    }
}
