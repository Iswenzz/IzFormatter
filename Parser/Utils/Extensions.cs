using System;
using System.Globalization;
using System.Text;

namespace Iswenzz.CoD4.Parser.Utils
{
    /// <summary>
    /// Extension methods class.
    /// </summary>
    public static class Extensions
    {
        /// <summary>
        /// Find the last index of a character.
        /// </summary>
        /// <param name="sb">The string builder.</param>
        /// <param name="find">The character to find.</param>
        /// <param name="ignoreCase">Should ignore case.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="culture">The culture info.</param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        public static int LastIndexOf(this StringBuilder sb, char find, 
            bool ignoreCase = false, int startIndex = -1, CultureInfo culture = null)
        {
            int lastIndex = -1;
            if (startIndex == -1)
                startIndex = sb.Length - 1;
            if (startIndex < 0 || startIndex >= sb.Length) 
                throw new ArgumentException("startIndex must be between 0 and sb.Lengh - 1", nameof(sb));
            if (culture == null) 
                culture = CultureInfo.InvariantCulture;

            if (ignoreCase)
                find = char.ToUpper(find, culture);
            for (int i = startIndex; i >= 0; i--)
            {
                char c = ignoreCase ? char.ToUpper(sb[i], culture) : sb[i];
                if (find == c)
                    return i;
            }
            return lastIndex;
        }

        /// <summary>
        /// Find the first index of a character.
        /// </summary>
        /// <param name="sb">The string builder.</param>
        /// <param name="find">The character to find.</param>
        /// <param name="ignoreCase">Should ignore case.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="culture">The culture info.</param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        public static int IndexOf(this StringBuilder sb, char find,
            bool ignoreCase = false, int startIndex = 0, CultureInfo culture = null)
        {
            int index = -1;
            if (startIndex < 0 || startIndex >= sb.Length)
                throw new ArgumentException("startIndex must be between 0 and sb.Lengh - 1", nameof(sb));
            if (culture == null)
                culture = CultureInfo.InvariantCulture;

            if (ignoreCase)
                find = char.ToUpper(find, culture);
            for (int i = startIndex; i < sb.Length; i++)
            {
                char c = ignoreCase ? char.ToUpper(sb[i], culture) : sb[i];
                if (find == c)
                    return i;
            }
            return index;
        }
    }
}
