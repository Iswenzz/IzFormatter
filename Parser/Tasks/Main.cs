﻿using Iswenzz.CoD4.Parser.Runtime;
using static GSCParser;

namespace Iswenzz.CoD4.Parser.Tasks.Function
{
    /// <summary>
    /// Add specific context to the main GSC function.
    /// </summary>
    public static class Main
    {
        /// <summary>
        /// Add SR Speedrun default spawn.
        /// </summary>
        /// <param name="context">The main function context.</param>
        public static void AddSpeedrunSpawn(FunctionStatementContext context)
        {
            string code = @"thread sr\api\_map::create_spawn_auto();";
            SimpleInputContext input = Recognizer.ParseSimpleInput(code);

            CompoundStatementContext compound = context.compoundStatement();
            compound.AddChildAt(1, input.statement());
        }

        /// <summary>
        /// Add SR Speedrun ways.
        /// </summary>
        /// <param name="context">The main function context.</param>
        public static void AddSpeedrunWays(FunctionStatementContext context)
        {
            string code = @"thread sr\api\_map::create_normal_way(""Normal Way;"");";
            SimpleInputContext input = Recognizer.ParseSimpleInput(code);

            CompoundStatementContext compound = context.compoundStatement();
            compound.AddChildAt(1, input.statement());
        }
    }
}