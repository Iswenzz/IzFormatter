using System;
using System.Collections.Generic;

using Iswenzz.CoD4.Parser.Abstract;
using Iswenzz.CoD4.Parser.Tasks;

namespace Iswenzz.CoD4.Parser.GSC
{
    /// <summary>
    /// SR Speedrun Function
    /// </summary>
    public class SRFunction : AbstractFunction
    {
        public SRFunction(List<string> lines, string GSCname) : base(lines, GSCname)
        {
            StartTasks();
        }

        /// <summary>
        /// Start all GSC modification tasks.
        /// </summary>
        protected virtual void StartTasks()
        {
            Lines = GSCTask.RemoveBannedFunction(this);
            switch (true)
            {
                case true when IsMain:
                    Lines = GSCTask.RemoveBannedMainFunction(this);
                    Lines = GSCTask.AddSpawn(this);
                    Lines = GSCTask.AddNormalWays(this);
                    break;

                case true when IsTrap:
                    Lines = GSCTask.RemoveTraps(this);
                    break;

                case true when HasLoop && HasDelay && HasTeleport:
                    Lines = GSCTask.RemoveTeleportsDelay(this);
                    break;
            }
            UpdateProperties();
        }
    }
}
