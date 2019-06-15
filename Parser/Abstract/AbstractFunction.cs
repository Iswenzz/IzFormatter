using System;
using System.Collections.Generic;
using System.Linq;

using Iswenzz.CoD4.Parser.Util;

namespace Iswenzz.CoD4.Parser.Abstract
{
    /// <summary>
    /// Abstract class for all information about a GSC Function.
    /// </summary>
    public abstract class AbstractFunction
    {
        private List<string> lines;
        /// <summary>
        /// Contains function lines, updates function properties on changes.
        /// </summary>
        public virtual List<string> Lines
        {
            get => lines;
            set { lines = value; UpdateProperties(); }
        }

        public virtual string GSCName { get; set; }
        public virtual string Name { get; set; }
        public virtual List<string> Params { get; set; }
        public virtual bool IsMain { get; set; }
        public virtual bool IsVoid { get; set; }
        public virtual bool IsTrap { get; set; }
        public virtual bool HasLoop { get; set; }
        public virtual bool HasDelay { get; set; }
        public virtual bool HasTeleport { get; set; }

        protected AbstractFunction(List<string> lines, string GSCname)
        {
            GSCName = GSCname;
            Lines = lines;
            Name = "";
            if (lines[0].Contains("("))
                Name = lines[0].SubAt(0, "(");
            Params = GetParams();

            IsMain = Name.Equals("main", StringComparison.InvariantCultureIgnoreCase) && GSCName.Contains("mp_");
            IsTrap = Name.Contains("trap", StringComparison.InvariantCultureIgnoreCase);
            IsVoid = true;
            HasLoop = false;
            HasDelay = false;
            HasTeleport = false;

            UpdateProperties();
        }

        /// <summary>
        /// Print the GSC function.
        /// </summary>
        protected virtual void PrintFunction()
        {
            foreach (string l in Lines ?? Enumerable.Empty<string>())
                Console.WriteLine(l);
            Console.WriteLine();
        }

        /// <summary>
        /// Update function properties.
        /// </summary>
        protected virtual void UpdateProperties()
        {
            foreach (string line in Lines ?? Enumerable.Empty<string>())
            {
                if (string.IsNullOrEmpty(line) || line == " ") continue;
                switch (true)
                {
                    case true when line.Replace(" ", "").Contains("for(", StringComparison.InvariantCultureIgnoreCase):
                        HasLoop = true;
                        break;
                    case true when line.Replace(" ", "").Contains("while(", StringComparison.InvariantCultureIgnoreCase):
                        HasLoop = true;
                        break;
                    case true when line.Replace(" ", "").Contains("wait(", StringComparison.InvariantCultureIgnoreCase):
                        HasDelay = true;
                        break;
                    case true when line.Contains("setorigin", StringComparison.InvariantCultureIgnoreCase):
                        HasTeleport = true;
                        break;
                    case true when line.Contains("wait ", StringComparison.InvariantCultureIgnoreCase):
                        HasDelay = true;
                        break;
                    case true when line.Contains("return ", StringComparison.InvariantCultureIgnoreCase):
                        IsVoid = false;
                        break;
                }
            }
        }

        /// <summary>
        /// Gets all params of this function.
        /// </summary>
        /// <returns>Params</returns>
        protected virtual List<string> GetParams()
        {
            List<string> param = new List<string>();
            if (!Lines[0].Contains("(") || !Lines[0].Contains(")")) return param;
            foreach (string tok in Lines[0].SubAt("(", ")").Replace(" ", "").Split(',') ?? Enumerable.Empty<string>())
            {
                if (string.IsNullOrEmpty(tok) || tok == " ") continue;
                else param.Add(tok.Replace(" ", ""));
            }
            return param;
        }
    }
}
