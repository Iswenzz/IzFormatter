using IzFormatter.Engine.Recognizers.GSC;
using static GSCParser;

using Antlr4.Runtime.Misc;

namespace IzFormatter.Engine.Plugins.GSC.Speedrun
{
    /// <summary>
    /// SR Speedrun plugin.
    /// </summary>
    public class Main : GSCParserBaseVisitor<string>
    {
        public GSCRecognizer GSC { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSC"/>.
        /// </summary>
        /// <param name="filepath">The file path.</param>
        public Main(string filepath) 
        {
            GSC = new GSCRecognizer(filepath);
        }

        /// <summary>
        /// Visit function statement.
        /// </summary>
        /// <param name="context">The function context.</param>
        /// <returns></returns>
        public override string VisitFunctionStatement([NotNull] FunctionStatementContext context)
        {
            base.VisitFunctionStatement(context);
            new Function(GSC, context);
            return context.GetText();
        }
    }
}
