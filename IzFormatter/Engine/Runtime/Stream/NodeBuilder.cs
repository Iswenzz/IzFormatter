using System.Collections.Generic;
using Antlr4.Runtime;

using IzFormatter.Engine.Utils;

namespace IzFormatter.Engine.Runtime.Stream
{
    /// <summary>
    /// Node builder parse tree.
    /// </summary>
    public static class NodeBuilder
    {
        public delegate List<object> BuildVariableCallback(object variable);

        /// <summary>
        /// Build the tree.
        /// </summary>
        /// <param name="node">The node position.</param>
        /// <param name="tree">The tree at the node position.</param>
        public static void Build(this ParserRuleContext context, object node, List<object> tree) =>
            context.ReplaceChilds(context.IndexOfChild(node), tree);

        /// <summary>
        /// Build all nodes from a specific variable name in the context.
        /// </summary>
        /// <param name="name">The name of variables to reflect.</param>
        /// <param name="context">The context.</param>
        /// <param name="callback">The build variable callback.</param>
        public static void BuildVariables(string name, ParserRuleContext context, BuildVariableCallback callback)
        {
            foreach (object variable in context.ReflectRuleVariables(name))
                context.Build(variable, callback(variable));
        }
    }
}
