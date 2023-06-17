using System;
using System.Collections.Generic;
using System.Linq;

using IzFormatter.Engine.Recognizers.GSC;

namespace IzFormatter.Engine.Runtime
{
    /// <summary>
    /// The formatter extension registry.
    /// </summary>
    internal static class Registry
    {
        public static Dictionary<Type, string> Recognizers { get; set; }

        /// <summary>
        /// Initializer the registry.
        /// </summary>
        static Registry()
        {
            Recognizers = new()
            {
                { typeof(GSCRecognizer), ".gsc .gsx .gsr" }
            };
        }

        /// <summary>
        /// Get the recognizer from file extension.
        /// </summary>
        /// <param name="fileExtension">The file extension.</param>
        /// <returns></returns>
        public static Type GetRecognizer(string fileExtension) =>
            Recognizers.FirstOrDefault(pair => pair.Value.Contains(fileExtension)).Key;
    }
}
