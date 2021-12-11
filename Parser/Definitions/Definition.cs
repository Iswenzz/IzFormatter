using System;
using System.Linq;
using System.Text;
using Antlr4.Runtime;
using Antlr4.Runtime.Misc;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Recognizer;
using Iswenzz.CoD4.Parser.Utils;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// Definition base class.
    /// </summary>
    public class Definition : GSCBaseVisitor<int>
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

            Visit(context);
        }

        /// <summary>
        /// On visit a <see cref="ITerminalNode"/>.
        /// </summary>
        /// <param name="node">The node to visit.</param>
        /// <returns></returns>
        public override int VisitTerminal(ITerminalNode node)
        {
            string result = node.GetText();
            switch (node.Symbol.Type)
            {
                case GSCParser.LeftBrace:
                    Stream.Append(Environment.NewLine);
                    IndentLine(Stream);
                    result += IndentNewLine();
                    break;
                case GSCParser.RightBrace:
                    DedentLine(Stream);
                    result += IndentNewLine();
                    break;
                case GSCParser.Semi:
                    result += IndentNewLine();
                    break;
            }
            switch (node.Parent.RuleContext.RuleIndex)
            {
                case GSCParser.RULE_iterationStatement:
                    result = node.GetText();
                    break;
                case GSCParser.RULE_selectionStatement:
                    result += IndentSingleLineStatement(node.Parent.RuleContext, node);
                    break;
            }

            Stream.Append(result);
            return base.VisitTerminal(node);
        }

        /// <summary>
        /// Indent a single line statement.
        /// TODO: make a rule for all single line statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <param name="node">The node to visit.</param>
        /// <returns></returns>
        protected virtual string IndentSingleLineStatement(RuleContext context, ITerminalNode node)
        {
            string result = string.Empty;
            var parentContext = context as GSCParser.SelectionStatementContext;

            if (parentContext.statement(0).compoundStatement() == null)
            {
                if (node.Symbol.Type == GSCParser.RightParen)
                {
                    IndentLevel++;
                    result += IndentNewLine();
                    IndentLevel--;
                }
            }
            return result;
        }

        /// <summary>
        /// Create a new indented line.
        /// </summary>
        protected virtual string IndentNewLine()
        {
            if (IndentLevel > 0)
                return Environment.NewLine + string.Concat(Enumerable.Repeat('\t', IndentLevel));
            return Environment.NewLine;
        }

        /// <summary>
        /// Indent the last line.
        /// </summary>
        /// <param name="source">The source.</param>
        protected virtual void IndentLine(StringBuilder source)
        {
            int lastIndex = source.LastIndexOf('\n') + 1;

            if (IndentLevel > 0)
                source.Insert(lastIndex, string.Concat(Enumerable.Repeat('\t', IndentLevel)));
            IndentLevel++;
        }

        /// <summary>
        /// Dedent the last line.
        /// </summary>
        /// <param name="source">The source.</param>
        protected virtual void DedentLine(StringBuilder source)
        {
            int lastIndex = source.LastIndexOf('\n') + 1;
            --IndentLevel;
            if (IndentLevel < 0)
                IndentLevel = 0;
            int lengthToRemove = IndentLevel == 0 ? 1 : IndentLevel;

            if (lastIndex >= 0 && lastIndex + lengthToRemove <= source.Length)
                source.Remove(lastIndex, lengthToRemove);
        }
    }
}
