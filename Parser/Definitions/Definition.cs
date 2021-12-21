using System.Text;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Recognizer;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// Definition base class.
    /// </summary>
    public class Definition : GSCParserBaseVisitor<string>
    {
        protected GSC GSC { get; set; }
        public ParserRuleContext Context { get; set; }
        public StringBuilder Stream { get; set; }

        protected int IndentLevel { get; set; }

        /// <summary>
        /// Initialize a new <see cref="CompilationUnit"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Definition(GSC gsc, ParserRuleContext context)
        {
            GSC = gsc;
            Context = context;
            Stream = new StringBuilder();
            Stream.Append(Visit(context));
        }

        /// <summary>
        /// Visit children node.
        /// </summary>
        /// <param name="node">The node to visit.</param>
        /// <returns></returns>
        public override string VisitChildren(IRuleNode node)
        {
            base.VisitChildren(node);
            return node.GetText();
        }
    }
}
