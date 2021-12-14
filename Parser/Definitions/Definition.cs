using System;
using System.Linq;
using System.Text;
using Antlr4.Runtime;
using Antlr4.Runtime.Misc;
using Antlr4.Runtime.Tree;

using Iswenzz.CoD4.Parser.Recognizer;
using Iswenzz.CoD4.Parser.Utils;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// Definition base class.
    /// </summary>
    public class Definition : GSCBaseVisitor<string>
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

        public override string VisitFunctionDeclaration([NotNull] FunctionDeclarationContext context)
        {
            base.VisitFunctionDeclaration(context);
            string result = context.identifier().GetText()
                + context.LeftParen()
                + context.identifierList()?.GetText()
                + context.RightParen();

            var compoundStatement = context.compoundStatement();
            if (compoundStatement != null)
                result += VisitCompoundStatement(compoundStatement);
            return result;
        }

        public override string VisitCompoundStatement([NotNull] CompoundStatementContext context)
        {
            base.VisitCompoundStatement(context);
            string result = string.Empty;

            result += Environment.NewLine + context.LeftBrace();
            IndentLine(ref result);
            result += IndentNewLine();

            foreach (var statement in context.blockItemList()?.statement() 
                ?? Enumerable.Empty<StatementContext>())
                result += VisitStatement(statement);

            result += context.RightBrace();
            DedentLine(ref result);
            result += IndentNewLine();
            return result;
        }

        public override string VisitSelectionStatement([NotNull] SelectionStatementContext context)
        {
            // TODO
            return base.VisitSelectionStatement(context) + IndentNewLine();
        }

        public override string VisitStatement([NotNull] StatementContext context)
        {
            string result = base.VisitStatement(context) + IndentNewLine();

            var compoundStatement = context.compoundStatement();
            var selectionStatement = context.selectionStatement();

            if (compoundStatement != null)
                result = VisitCompoundStatement(compoundStatement);
            else if (selectionStatement != null)
                result = VisitSelectionStatement(selectionStatement);
            return result;
        }

        public override string VisitChildren(IRuleNode node)
        {
            base.VisitChildren(node);
            return node.GetText();
        }

        /// <summary>
        /// Indent a single line statement.
        /// TODO: make a rule for all single line statement.
        /// </summary>
        /// <param name="context">The statement context.</param>
        /// <param name="node">The node to visit.</param>
        /// <returns></returns>
        protected virtual string IndentSingleLineStatement(StatementContext context, ITerminalNode node)
        {
            string result = string.Empty;
            if (node.Symbol.Type == RightParen && context.compoundStatement() == null)
            {
                IndentLevel++;
                result += IndentNewLine();
                IndentLevel--;
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
        protected virtual void IndentLine(ref string source)
        {
            int lastIndex = source.LastIndexOf('\n') + 1;

            if (IndentLevel > 0)
                source = source.Insert(lastIndex, string.Concat(Enumerable.Repeat('\t', IndentLevel)));
            IndentLevel++;
        }

        /// <summary>
        /// Dedent the last line.
        /// </summary>
        /// <param name="source">The source.</param>
        protected virtual void DedentLine(ref string source)
        {
            int lastIndex = source.LastIndexOf('\n') + 1;
            --IndentLevel;
            if (IndentLevel < 0)
                IndentLevel = 0;
            int lengthToRemove = IndentLevel == 0 ? 1 : IndentLevel;

            if (lastIndex >= 0 && lastIndex + lengthToRemove <= source.Length)
                source = source.Remove(lastIndex, lengthToRemove);
        }
    }
}
