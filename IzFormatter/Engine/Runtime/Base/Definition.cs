using Antlr4.Runtime;

namespace IzFormatter.Engine.Runtime.Base
{
    /// <summary>
    /// Base context definition.
    /// </summary>
    public abstract class Definition<T> where T : ParserRuleContext
    {
        public T Context { get; set; }

        /// <summary>
        /// Get the context text.
        /// </summary>
        /// <returns></returns>
        public virtual string GetText() =>
            Context.GetText();
    }
}
