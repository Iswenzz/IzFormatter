using System;
using System.Collections.Generic;
using System.Linq;

namespace Iswenzz.CoD4.Parser.Utils
{
    /// <summary>
    /// Extension utility class.
    /// </summary>
    public static class Extensions
    {
        /// <summary>
        /// Checks if a string is equal to another, ignoring case.
        /// </summary>
        /// <param name="strA">The first string.</param>
        /// <param name="strB">The second string.</param>
        /// <returns></returns>
        public static bool EqualsIgnoreCase(this string strA, string strB) =>
            strA.Equals(strB, StringComparison.InvariantCultureIgnoreCase);

        /// <summary>
        /// Checks if a string contains another, ignoring case.
        /// </summary>
        /// <param name="strA">The first string.</param>
        /// <param name="strB">The second string.</param>
        /// <returns></returns>
        public static bool ContainsIgnoreCase(this string strA, string strB) =>
            strA.Contains(strB, StringComparison.InvariantCultureIgnoreCase);

        /// <summary>
        /// Checks if a collection contains a string, ignoring case.
        /// </summary>
        /// <param name="source">The enumerable source.</param>
        /// <param name="str">The string to check.</param>
        /// <returns></returns>
        public static bool ContainsIgnoreCase(this IEnumerable<string> source, string str) =>
            source.Any(item => str.ContainsIgnoreCase(item));

        /// <summary>
        /// Checks if a collection contains the exact string, ignoring case.
        /// </summary>
        /// <param name="source">The enumerable source.</param>
        /// <param name="str">The string to check.</param>
        /// <returns></returns>
        public static bool ContainsExactIgnoreCase(this IEnumerable<string> source, string str) =>
            source.Any(item => str.EqualsIgnoreCase(item));

        /// <summary>
        /// Foreach wrapper for <see cref="IEnumerable{T}"/>
        /// </summary>
        /// <typeparam name="T">The source type.</typeparam>
        /// <param name="source">The enumerable source.</param>
        /// <param name="action">The callback for each item.</param>
        public static void ForEach<T>(this IEnumerable<T> source, Action<T> action)
        {
            foreach (T item in source)
                action(item);
        }
    }
}
