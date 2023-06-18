using System;
using System.Collections.Generic;
using System.Linq;

using IzFormatter.Engine.Recognizers.GSC;

namespace IzFormatter.Engine.Runtime
{
    /// <summary>
    /// The formatter extension registry.
    /// </summary>
    public static class RecognizerRegistry
    {
        public static Dictionary<Type, string> Recognizers { get; set; }

        /// <summary>
        /// Initializer the registry.
        /// </summary>
        static RecognizerRegistry()
        {
            Recognizers = new()
            {
                { typeof(GSCRecognizer), ".gsc .gsx .gsr" }
            };
        }

        /// <summary>
        /// Register a recognizer.
        /// </summary>
        /// <param name="type">The recognizer type.</param>
        /// <param name="extensions">The language file extensions.</param>
        public static void RegisterRecognizer(Type type, string extensions) =>
            Recognizers.Add(type, extensions);

        /// <summary>
        /// Replace a recognizer.
        /// </summary>
        /// <param name="extension">The language file extension.</param>
        /// <param name="type">The recognizer type.</param>
        public static void ReplaceRecognizer(string extension, Type type)
        {
            (Type found, string extensions) = Recognizers.FirstOrDefault(pair => pair.Value.Contains(extension));
            if (found == null)
                return;

            Recognizers.Remove(found);
            Recognizers.Add(type, extensions);
        }

        /// <summary>
        /// Get the recognizer from file extension.
        /// </summary>
        /// <param name="extension">The file extension.</param>
        /// <returns></returns>
        public static Type GetRecognizer(string extension) =>
            Recognizers.FirstOrDefault(pair => pair.Value.Contains(extension)).Key;
    }
}
