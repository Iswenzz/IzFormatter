using System;
using System.Collections.Generic;
using System.Linq;

namespace Iswenzz.CoD4.Parser.Util
{
    public static class UtilList
    {
        /// <summary>
        /// Pick all lines in this list between 2 integers, and create a new list.
        /// </summary>
        /// <param name="list">List of strings</param>
        /// <param name="start">Start index</param>
        /// <param name="end">End index</param>
        public static List<string> ListBetween(this List<string> list, int start, int end)
        {
            List<string> new_list = new List<string>();
            for (int i = start; i < end; i++)
                new_list.Add(list[i]);
            return new_list;
        }
    }
}
