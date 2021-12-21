using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Utils;

namespace Iswenzz.CoD4.Parser.Grammar
{
    /// <summary>
    /// Build extra node in a parse tree.
    /// </summary>
    public class ExtraNode
    {
        public ParserRuleContext Context { get; set; }
        public List<IParseTree> Childs { get; set; }

        public dynamic Node { get; set; }
        public int CancelToken { get; set; }
        public ArrayList RebuildTree { get; set; }

        /// <summary>
        /// Initialize a new <see cref="ExtraNode"/>.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public ExtraNode(ParserRuleContext context)
        {
            Context = context;
            Childs = context.GetChilds().ToList();
            RebuildTree = new ArrayList();
        }

        /// <summary>
        /// Rebuild the tree nodes.
        /// </summary>
        public virtual void RebuildNode()
        {
            if (Childs.ContainsToken(CancelToken))
                return;
            int needChangeIndex = ParserUtils.IndexOfChild(Childs, Node);

            Context.RemoveChilds();
            for (int i = 0; i < Childs.Count; i++)
            {
                if (i == needChangeIndex)
                {
                    foreach (dynamic child in RebuildTree)
                        Context.AddChild(child);
                }
                else
                    Context.AddChild((dynamic)Childs[i]);
            }
        }

        /// <summary>
        /// Build the <see cref="ExtraNode"/>.
        /// </summary>
        /// <param name="extraNode">The <see cref="ExtraNode"/> to build.</param>
        public static void Build(ExtraNode extraNode)
        {
            if (extraNode?.Node == null)
                return;
            extraNode.RebuildNode();
        }
    }
}
