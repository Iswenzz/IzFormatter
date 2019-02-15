using System;
using System.Globalization;

namespace Iswenzz.CoD4.Parser.GSC
{
    /// <summary>
    /// Represents a 3D mathematical vector.
    /// </summary>
    public struct Vector3 : IEquatable<Vector3>, IFormattable
    {
        /// <summary>
        /// X axis of the vector.
        /// </summary>
        public float X;

        /// <summary>
        /// Y axis of the vector.
        /// </summary>
        public float Y;

        /// <summary>
        /// Z axis of the vector.
        /// </summary>
        public float Z;

        /// <summary>
        /// Create a default Vector (0, 0, 0).
        /// </summary>
        public static Vector3 Zero() =>
            new Vector3(0, 0, 0);

        /// <summary>
        /// Create a new Vector3.
        /// </summary>
        /// <param name="x">Value of X.</param>
        /// <param name="y">Value of Y.</param>
        /// <param name="z">Value of Z.</param>
        public Vector3(float x, float y, float z)
        {
            X = x;
            Y = y;
            Z = z;
        }

        /// <summary>
        /// Create a new Vector3 and assign 1 value to every axis.
        /// </summary>
        /// <param name="value">Value to assign.</param>
        public Vector3(float value)
        {
            X = value;
            Y = value;
            Z = value;
        }

        /// <summary>
        /// Create a new Vector3 from an array of floats.
        /// </summary>
        /// <param name="array">float3 array.</param>
        public Vector3(float[] array)
        {
            if (array == null) throw new ArgumentNullException("array");
            if (array.Length != 3) throw new ArgumentOutOfRangeException("array", "There must be 3 float in the array.");

            X = array[0];
            Y = array[1];
            Z = array[2];
        }

        /// <summary>
        /// <see cref="string"/> representation of this Vector3.
        /// </summary>
        /// <param name="format">The format.</param>
        public override string ToString() =>
            string.Format(CultureInfo.CurrentCulture, "({0}, {1}, {2})", X, Y, Z);

        /// <summary>
        /// <see cref="string"/> representation of this Vector3.
        /// </summary>
        /// <param name="format">The format.</param>
        public string ToString(string format) =>
            string.Format(format, CultureInfo.CurrentCulture, "({0}, {1}, {2})", X.ToString(format, CultureInfo.CurrentCulture),
                Y.ToString(format, CultureInfo.CurrentCulture), Z.ToString(format, CultureInfo.CurrentCulture));

        /// <summary>
        /// <see cref="string"/> representation of this Vector3.
        /// </summary>
        /// <param name="formatProvider">The format provider.</param>
        public string ToString(IFormatProvider formatProvider) =>
            string.Format(formatProvider, "({0}, {1}, {2})", X, Y, Z);

        /// <summary>
        /// <see cref="string"/> representation of this Vector3.
        /// </summary>
        /// <param name="format">The format.</param>
        /// <param name="formatProvider">The format provider.</param>
        public string ToString(string format, IFormatProvider formatProvider)
        {
            if (format == null) return ToString(formatProvider);
            return string.Format(formatProvider, "({0}, {1}, {2})", X.ToString(format, formatProvider),
                Y.ToString(format, formatProvider), Z.ToString(format, formatProvider));
        }

        /// <summary>
        /// Check if this vector is equal to another vector.
        /// </summary>
        /// <param name="other">The vector to check.</param>
        public bool Equals(Vector3 other) =>
            X.Equals(other.X) && Y.Equals(other.Y) && Z.Equals(other.Z);
    }
}
