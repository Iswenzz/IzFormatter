using System;
using System.Collections.Generic;

using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Runtime
{
    /// <summary>
    /// Node builder editing a parse tree.
    /// </summary>
    public class NodeBuilder
    {
        public ParserRuleContext Context { get; set; }
        public dynamic Node { get; set; }

        public Func<List<dynamic>> BuildParseTree { get; set; }

        /// <summary>
        /// Initialize a new <see cref="NodeBuilder"/>.
        /// </summary>
        /// <param name="context">The rule context.</param>
        public NodeBuilder(ParserRuleContext context) =>
            Context = context;

        /// <summary>
        /// Rebuild the tree nodes.
        /// </summary>
        public virtual void RebuildNode()
        {
            if (BuildParseTree == null)
                return;
            Context.ReplaceChilds(Context.IndexOfChild((object)Node), BuildParseTree);
        }

        /// <summary>
        /// Build the <see cref="NodeBuilder"/>.
        /// </summary>
        /// <param name="builder">The <see cref="NodeBuilder"/> to build.</param>
        public static void Build(NodeBuilder builder)
        {
            if (builder?.Node == null)
                return;
            builder.RebuildNode();
        }

        /// <summary>
        /// Build many nodes.
        /// </summary>
        /// <param name="vars">The nodes to build.</param>
        /// <param name="buildNodeCallback">The build node callback.</param>
        public static void BuildMany(List<dynamic> vars, Func<dynamic, NodeBuilder> buildNodeCallback) =>
            vars.ForEach(var => Build(buildNodeCallback(var)));

        /// <summary>
        /// Build many nodes from a specific variable name in rule.
        /// </summary>
        /// <param name="name">The name of variables to reflect.</param>
        /// <param name="rule">The rule to reflect.</param>
        /// <param name="buildNodeCallback">The build node callback.</param>
        public static void ReflectBuildMany(string name, ParserRuleContext rule,
            Func<dynamic, NodeBuilder> buildNodeCallback) =>
            BuildMany(rule.ReflectRuleVariables(name), buildNodeCallback);
    }
}
