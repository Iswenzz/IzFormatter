using Iswenzz.CoD4.Parser.Definitions;

namespace Iswenzz.CoD4.Parser.Recognizers
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
        /// Parse the GSC.
        /// </summary>
        public override void Parse() =>
            CompilationUnit = new SpeedrunCompilationUnit(this, Recognizer.Parser.compilationUnit());
    }
}
