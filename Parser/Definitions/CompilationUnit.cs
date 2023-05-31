﻿using System;
using Antlr4.Runtime.Misc;

using Iswenzz.CoD4.Parser.Recognizers;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// GSC compilation unit.
    /// </summary>
    public class CompilationUnit : Definition<CompilationUnitContext>
    {
        /// <summary>
        /// Initialize a new <see cref="CompilationUnit"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public CompilationUnit(GSC gsc, CompilationUnitContext context) : base(gsc, context) { } 

        /// <summary>
        /// Function statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override string VisitFunctionStatement([NotNull] FunctionStatementContext context)
        {
            GSC.Stream.Append(new Function(GSC, context).Stream + Environment.NewLine);
            return null;
        }

        /// <summary>
        /// Directive statement.
        /// </summary>
        /// <param name="context">The definition context.</param>
        /// <returns></returns>
        public override string VisitDirectiveStatement([NotNull] DirectiveStatementContext context)
        {
            GSC.Stream.Append(new Include(GSC, context).Stream);
            return null;
        }
    }
}