using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Iswenzz.CoD4.Parser.Util
{
    public static class UtilString
    {
        /// <summary> Substring start at specified index. </summary>
        public static string SubAt(this string line, string indexStart) =>
            line.Substring(line.IndexOf(indexStart) + indexStart.Length, line.Length - line.IndexOf(indexStart));

        /// <summary> Substring start at specified index and has a specified length. </summary>
        public static string SubAt(this string line, string indexStart, string indexEnd) =>
            line.Substring(line.IndexOf(indexStart) + indexStart.Length, line.IndexOf(indexEnd) - line.IndexOf(indexStart) - indexEnd.Length);

        /// <summary> Substring start at specified index and has a specified length. </summary>
        public static string SubAt(this string line, int indexStart, string indexEnd) =>
            line.Substring(indexStart, line.IndexOf(indexEnd) - indexStart);

        /// <summary> Substring start at specified index and has a specified length. </summary>
        public static string SubAt(this string line, string indexStart, int indexEnd) =>
            line.Substring(line.IndexOf(indexStart), indexEnd - line.IndexOf(indexStart));

        /// <summary> Substring start at specified index. </summary>
        public static string SubAt(this string line, int indexStart) =>
            line.Substring(indexStart, line.Length - indexStart);

        /// <summary> Substring start at specified index and has a specified length. </summary>
        public static string SubAt(this string line, int indexStart, int indexEnd) =>
            line.Substring(indexStart, indexEnd - indexStart);

        /// <summary>
        /// Returns a value indicating whether a specified substring occurs within this string.
        /// </summary>
        /// <param name="value">Value to check</param>
        /// <param name="comparisonType">Comparison Type</param>
        public static bool Contains(this string line, string value, StringComparison type) =>
            line?.IndexOf(value, type) >= 0;

        /// <summary>
        /// Returns a value indicating whether a function call is threaded with the "thread" keyword.
        /// </summary>
        /// <param name="funcIndex">Start index of the function call</param>
        /// <returns>The start index of the "thread" keyword</returns>
        public static int IsCallThreaded(this string line, int funcIndex)
        {
            while (line[funcIndex--] != ';')
            {
                if (funcIndex - 5 >= 0)
                {
                    // thread
                    if (line[funcIndex - 5] == 't' && line[funcIndex - 4] == 'h' && line[funcIndex - 3] == 'r'
                        && line[funcIndex - 2] == 'e' && line[funcIndex - 1] == 'a' && line[funcIndex] == 'd')
                        return funcIndex - 5;
                }
                else return -1;
            }
            return -1;
        }

        /// <summary>
        /// Returns a value indicating whether the index is inside a string.
        /// </summary>
        /// <param name="funcIndex">Start index of the function call</param>
        /// <returns></returns>
        public static bool IsInsideString(this string line, int funcIndex)
        {
            bool started = false;
            while (line[funcIndex--] != ';')
            {
                if (line[funcIndex] == '\"')
                    started = true;
                else if ((line[funcIndex] == '(' || line[funcIndex] == '(') && started)
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Returns a value indicating whether a function call is using a struct.
        /// </summary>
        /// <param name="funcIndex">Start index of the function call</param>
        /// <returns></returns>
        public static int IsCallStruct(this string line, int funcIndex)
        {
            char[] arr_stop = new char[] { ';', '{', '}', '(', ')', '*', '\"' };
            bool started = false;
            funcIndex--;
            funcIndex--;

            while (!arr_stop.Any(c => line[funcIndex] == c))
            {
                if (char.IsWhiteSpace(line[funcIndex]) && !started)
                {
                    funcIndex--;
                    continue;
                }
                else if (char.IsWhiteSpace(line[funcIndex]) && started)
                {
                    started = false;
                    return ++funcIndex;
                }
                else if (char.IsLetter(line[funcIndex]) || char.IsDigit(line[funcIndex])
                    || char.IsPunctuation(line[funcIndex]) && !arr_stop.Any(c => line[funcIndex] == c))
                    started = true;
                else
                    return -1;
                funcIndex--;
            }
            return -1;
        }

        /// <summary>
        /// Returns all start index of matching words in a string.
        /// </summary>
        /// <param name="value">Value to find.</param>
        /// <returns></returns>
        public static IEnumerable<int> OccurrencesIndex(this string line, string value)
        {
            Regex rx = new Regex("(?i)" + value);
            foreach (Match match in rx.Matches(line))
                yield return match.Index;
        }
    }
}
