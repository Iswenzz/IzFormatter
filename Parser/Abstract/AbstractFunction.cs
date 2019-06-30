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
        private string text;
        /// <summary>
        /// Contains function lines, updates function properties on changes.
        /// </summary>
        public virtual string FunctionText
        {
            get => text;
            set { text = value; UpdateProperties(); }
        }

        public virtual string Name { get; set; }
        public virtual string NameWithParams { get; set; }
        public virtual List<string> Params { get; set; }
        public virtual bool IsMain { get; set; }
        public virtual bool IsVoid { get; set; }
        public virtual bool IsTrap { get; set; }
        public virtual bool HasLoop { get; set; }
        public virtual bool HasDelay { get; set; }
        public virtual bool HasTeleport { get; set; }

        public virtual int BodyIndex { get; set; }

        protected AbstractFunction(string functionText)
        {
            FunctionText = functionText;
            NameWithParams = FunctionText.SubAt(0, "{");
            Name = NameWithParams.SubAt(0, "(");
            Params = GetParams();
            BodyIndex = FunctionText.IndexOf("{") + 1;

            IsVoid = true;
            IsMain = Name.Contains("main", StringComparison.InvariantCultureIgnoreCase) && Params.Count == 0;
            IsTrap = Name.Contains("trap", StringComparison.InvariantCultureIgnoreCase);

            UpdateProperties();
        }

        /// <summary>
        /// Print the GSC function.
        /// </summary>
        protected virtual void PrintFunction()
        {
            Console.WriteLine("\nNEW FUNCTION\n");
            foreach (char c in FunctionText)
                Console.Write(c);
            Console.WriteLine();
        }

        /// <summary>
        /// Update function properties.
        /// </summary>
        protected virtual void UpdateProperties()
        {
            if (string.IsNullOrEmpty(FunctionText) || FunctionText == " ") return;

            if (FunctionText.Replace(" ", "").Contains("for(", StringComparison.InvariantCultureIgnoreCase)
                || FunctionText.Replace(" ", "").Contains("while(", StringComparison.InvariantCultureIgnoreCase))
                HasLoop = true;

            if (FunctionText.Replace(" ", "").Contains("wait(", StringComparison.InvariantCultureIgnoreCase)
                || FunctionText.Contains("wait ", StringComparison.InvariantCultureIgnoreCase))
                HasDelay = true;

            if (FunctionText.Contains("setorigin", StringComparison.InvariantCultureIgnoreCase))
                HasTeleport = true;

            if (FunctionText.Contains("return ", StringComparison.InvariantCultureIgnoreCase))
                IsVoid = false;
        }

        /// <summary>
        /// Gets all params of this function.
        /// </summary>
        /// <returns>Params</returns>
        protected virtual List<string> GetParams()
        {
            List<string> param = new List<string>();
            if (!NameWithParams.Contains("(") || !NameWithParams.Contains(")")) return param;
            try
            {
                foreach (string tok in NameWithParams.SubAt("(", ")").Replace(" ", "").Split(',')
                ?? Enumerable.Empty<string>())
                {
                    if (string.IsNullOrEmpty(tok) || tok == " ") continue;
                    else param.Add(tok.Replace(" ", ""));
                }
            }
            catch { }
            return param;
        }
    }
}
