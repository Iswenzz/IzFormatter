﻿using System;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

namespace Iswenzz.CoD4.Parser.Runtime
{
    /// <summary>
    /// Build extra node in a parse tree.
    /// </summary>
    public class ExtraNode
    {
        public ParserRuleContext Context { get; set; }
        public IEnumerable<IParseTree> Childs { get; set; }
        public dynamic Node { get; set; }

        public Func<List<dynamic>> BuildParseTree { get; set; }

        /// <summary>
        /// Initialize a new <see cref="ExtraNode"/>.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public ExtraNode(ParserRuleContext context)
        {
            Context = context;
            Childs = context.Childs();
        }

        /// <summary>
        /// Rebuild the tree nodes.
        /// </summary>
        public virtual void RebuildNode()
        {
            if (BuildParseTree == null)
                return;
            int needChangeIndex = Childs.IndexOfChild((object)Node);
            Context.ReplaceChilds(needChangeIndex, BuildParseTree);
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

        /// <summary>
        /// Build many nodes.
        /// </summary>
        /// <param name="vars">The nodes to build.</param>
        /// <param name="buildNodeCallback">The build node callback.</param>
        public static void BuildMany(List<dynamic> vars, Func<dynamic, ExtraNode> buildNodeCallback) =>
            vars.ForEach(var => Build(buildNodeCallback(var)));
    }
}
