using Iswenzz.CoD4.Parser.Grammar;
using Iswenzz.CoD4.Parser.Utils;
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
            SimpleInputContext input = GSCRecognizer.ParseSimpleInput(code);

            CompoundStatementContext compound = context.compoundStatement();
            compound.AddChildAt(input.statement(), 1);
        }

        /// <summary>
        /// Add SR Speedrun ways.
        /// </summary>
        /// <param name="context">The main function context.</param>
        public static void AddSpeedrunWays(FunctionStatementContext context)
        {
            string code = @"thread sr\api\_map::create_normal_way(""Normal Way;"");";
            SimpleInputContext input = GSCRecognizer.ParseSimpleInput(code);

            CompoundStatementContext compound = context.compoundStatement();
            compound.AddChildAt(input.statement(), 1);
        }
    }
}
