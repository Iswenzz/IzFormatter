using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Definitions.Function;
using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Listeners
{
    /// <summary>
    /// GSC ANTLRv4 listener.
    /// </summary>
    public class SRListener : GSCListener
    {
        /// <summary>
        /// Initialize a new <see cref="GSCListener"/>.
        /// </summary>
        public SRListener(GSC gsc) : base(gsc) { }

        /// <summary>
        /// Enter function declaration.
        /// </summary>
        /// <param name="context">Function context.</param>
        public override void EnterFunctionDeclaration([NotNull] GSCParser.FunctionDeclarationContext context) =>
             GSC.Functions.Add(new SRFunction(context));
    }
}
