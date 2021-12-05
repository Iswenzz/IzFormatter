using Iswenzz.CoD4.Parser.Listeners;
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
        /// Parse the GSC.
        /// </summary>
        public override void Parse()
        {
            Listener = new SRListener(this);
            CompilationUnitContext code = Parser.compilationUnit();
            Walker.Walk(Listener, code);
        }
    }
}
