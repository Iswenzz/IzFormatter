﻿using System;
using System.IO;

using Antlr4.Runtime;

namespace Iswenzz.CoD4.Parser.Runtime
{
    /// <summary>
    /// Parser base class.
    /// </summary>
    public class ParserBase : Antlr4.Runtime.Parser
    {
        public override string[] RuleNames => throw new NotImplementedException();
        public override IVocabulary Vocabulary => throw new NotImplementedException();
        public override string GrammarFileName => throw new NotImplementedException();

        /// <summary>
        /// Initialize a new <see cref="ParserBase"/>.
        /// </summary>
        /// <param name="input">The token stream.</param>
        public ParserBase(ITokenStream input) : base(input) { }

        /// <summary>
        /// Initialize a new <see cref="ParserBase"/>.
        /// </summary>
        /// <param name="input">The token stream.</param>
        /// <param name="output">the output stream.</param>
        /// <param name="errorOutput">The error stream.</param>
        public ParserBase(ITokenStream input, TextWriter output, TextWriter errorOutput) 
            : base(input, output, errorOutput) { }

        /// <summary>
        /// Enable a channel.
        /// </summary>
        /// <param name="channel">The channel index.</param>
        /// <exception cref="TypeAccessException"></exception>
        protected virtual void EnableChannel(int channel)
        {
            if (InputStream is not MultiChannelTokenStream multiChannelInputStream)
                throw new TypeAccessException();
            multiChannelInputStream.Enable(channel);
        }

        /// <summary>
        /// Disable a channel.
        /// </summary>
        /// <param name="channel">The channel index.</param>
        /// <exception cref="TypeAccessException"></exception>
        protected virtual void DisableChannel(int channel)
        {
            if (InputStream is not MultiChannelTokenStream multiChannelInputStream)
                throw new TypeAccessException();
            multiChannelInputStream.Disable(channel);
        }
    }
}
