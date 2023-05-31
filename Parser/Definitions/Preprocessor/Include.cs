﻿using Iswenzz.CoD4.Parser.Recognizers;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Definitions
{
    /// <summary>
    /// Include directive.
    /// </summary>
    public class Include : Definition<DirectiveStatementContext>
    {
        /// <summary>
        /// Initialize a new <see cref="Include"/>.
        /// </summary>
        /// <param name="gsc">The GSC instance.</param>
        /// <param name="context">The definition context.</param>
        public Include(GSC gsc, DirectiveStatementContext context) : base(gsc, context) { }

        /// <summary>
        /// Construct additional data before visiting the context.
        /// </summary>
        public override void Construct()
        {
            GSC.Recognizer.Formatter.BuildRule(Context);
            base.Construct();
        }
    }
}