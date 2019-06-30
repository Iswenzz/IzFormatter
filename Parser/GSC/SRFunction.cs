using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.Tasks;

namespace Iswenzz.CoD4.Parser.GSC
{
    /// <summary>
    /// SR Speedrun Function
    /// </summary>
    public class SRFunction : AbstractFunction
    {
        public SRFunction(string functionText) : base(functionText)
        {
            //PrintFunction();
            StartTasks();
        }

        /// <summary>
        /// Start all GSC modification tasks.
        /// </summary>
        protected virtual void StartTasks()
        {
            FunctionText = GSCTask.RemoveBannedFunction(this);
            switch (true)
            {
                case true when IsMain:
                    FunctionText = GSCTask.RemoveBannedMainFunction(this);
                    FunctionText = GSCTask.AddSpawn(this);
                    FunctionText = GSCTask.AddNormalWays(this);
                    break;

                case true when IsTrap:
                    FunctionText = GSCTask.RemoveTraps(this);
                    break;

                case true when HasLoop && HasDelay && HasTeleport:
                    FunctionText = GSCTask.RemoveTeleportsDelay(this);
                    break;
            }
            UpdateProperties();
        }
    }
}
