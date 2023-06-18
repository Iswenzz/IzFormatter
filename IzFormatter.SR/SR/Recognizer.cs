using IzFormatter.Engine.Recognizers.GSC;

namespace IzFormatter.SR
{
    /// <summary>
    /// SR Recognizer.
    /// </summary>
    public class Recognizer : GSCRecognizer
    {
        public Visitor Visitor { get; set; }

        /// <summary>
        /// Initialize a new <see cref="Recognizer"/>.
        /// </summary>
        /// <param name="input">The code input.</param>
        public Recognizer(string input) : base(input)
        {
            Visitor = new Visitor();
        }

        /// <summary>
        /// Process the input.
        /// </summary>
        public override void Process()
        {
            base.Process();
            Parser.Reset();
            Visitor.Visit(Parser.compilationUnit());
        }
    }
}
