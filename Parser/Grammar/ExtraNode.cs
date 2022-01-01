﻿using System;
using System.Collections;
using System.Collections.Generic;

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
        public IEnumerable<IParseTree> Childs { get; set; }
        public dynamic Node { get; set; }

        public Func<ArrayList> BuildParseTree { get; set; }

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
            int needChangeIndex = ParserUtils.IndexOfChild(Childs, Node);
            Context.ReplaceChilds(BuildParseTree(), needChangeIndex);
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

        /// <summary>
        /// Add child to a specific index.
        /// </summary>
        /// <param name="context">The rule context.</param>
        /// <param name="child">The child to add.</param>
        /// <param name="index">The index to add the child to.</param>
        public static void AddChildAt(ParserRuleContext context, dynamic child, int index) =>
            context.AddChilds(new ArrayList { child }, index);
    }
}
