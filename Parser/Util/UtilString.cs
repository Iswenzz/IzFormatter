using System;
using System.Linq;

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
    }
}
