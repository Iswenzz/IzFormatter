using Antlr4.Runtime.Tree;
using Iswenzz.CoD4.Parser.Runtime;

namespace Iswenzz.CoD4.Parser.Recognizers.GSC
{
    /// <summary>
    /// GSC Visitor.
    /// </summary>
    public class GSCFormatter : GSCParserBaseVisitor<string>
    {
        protected GSCRecognizer GSC { get; set; }
        public Formatter BaseFormatter { get; set; }

        /// <summary>
        /// Initialize a new <see cref="GSCFormatter"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        public GSCFormatter(GSCRecognizer gsc)
        {
            GSC = gsc;
            BaseFormatter = new Formatter();
        }

        /// <summary>
        /// Visit all nodes.
        /// </summary>
        /// <param name="tree">The tree.</param>
        /// <returns></returns>
        public override string Visit(IParseTree tree)
        {
            base.Visit(tree);
            BaseFormatter.BuildRule(tree);
            return tree.GetText();
        }
    }
}
