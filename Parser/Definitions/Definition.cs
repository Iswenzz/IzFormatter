using System.Text;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Recognizers;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// Definition base class.
    /// </summary>
    public class Definition<T> : GSCParserBaseVisitor<string> where T : ParserRuleContext
    {
        protected GSC GSC { get; set; }
        public StringBuilder Stream { get; set; }
        public T Context { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Definition"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Definition(GSC gsc, T context)
        {
            GSC = gsc;
            Context = context;
            Stream = new StringBuilder();

            Construct();
            Stream.Append(Visit(context));
        }

        /// <summary>
        /// Construct additional data before visiting the context.
        /// </summary>
        public virtual void Construct() { }

        /// <summary>
        /// Visit children node and get its text.
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
