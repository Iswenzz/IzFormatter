using System;
using Antlr4.Runtime;

namespace IzFormatter.Engine.Runtime
{
	/// <summary>
	/// Token stream supporting multiple channels.
	/// </summary>
	public class MultiChannelTokenStream : BufferedTokenStream
	{
		const int EOF = -1;
		private int[] channels = new int[] { 0 };

		/// <summary>
		/// Initialize a new <see cref="MultiChannelTokenStream"/>.
		/// </summary>
		/// <param name="tokenSource">The token source.</param>
		public MultiChannelTokenStream(ITokenSource tokenSource) : base(tokenSource) { }

		/// <summary>
		/// Enable a channel.
		/// </summary>
		/// <param name="channel">The channel id.</param>
		public void Enable(int channel)
		{
			foreach (int existingChannel in channels)
			{
				if (channel == existingChannel)
					return;
			}
			int len = channels.Length;
			Array.Resize(ref channels, len + 1);
			channels[len] = channel;

			int i = p - 1;
			while (i >= 0)
			{
				IToken token = Get(i);
				if (token.Channel == channel || !IsEnabled(token.Channel))
					i--;
				else
					break;
			}
			p = i + 1;
		}

		/// <summary>
		/// Disable a channel.
		/// </summary>
		/// <param name="channel">The channel id.</param>
		public void Disable(int channel)
		{
			int remainder = 0;
			for (int i = 0; i < channels.Length; i++)
			{
				if (channels[i] == channel)
					continue;
				else
				{
					channels[remainder] = channels[i];
					remainder++;
				}
			}
			Array.Resize(ref channels, remainder);
		}

		/// <summary>
		/// Allows derived classes to modify the behavior of operations which change the
		/// current stream position by adjusting the target token index of a seek operation.
		/// </summary>
		/// <param name="i">The target token index.</param>
		/// <returns></returns>
		protected override int AdjustSeekIndex(int i) =>
			NextTokenOnChannel(i);

		/// <summary>
		/// Reads token backward.
		/// </summary>
		/// <param name="tokenToRead">The amount of token to read.</param>
		/// <returns></returns>
		protected override IToken Lb(int tokenToRead)
		{
			if (tokenToRead == 0 || (p - tokenToRead) < 0)
				return null;

			int i = p;
			for (int n = 1; n <= tokenToRead; n++)
				i = PreviousTokenOnChannel(i - 1);

			if (i < 0)
				return null;
			else
				return Get(i);
		}

		/// <summary>
		/// Reads token forward.
		/// </summary>
		/// <param name="tokenToRead">The amount of token to read.</param>
		/// <returns></returns>
		public override IToken LT(int tokenToRead)
		{
			LazyInit();
			if (tokenToRead == 0)
				return null;
			if (tokenToRead < 0)
				return Lb(-tokenToRead);

			int i = p;
			for (int n = 1; n < tokenToRead; n++)
			{
				if (Sync(i + 1))
					i = NextTokenOnChannel(i + 1);
			}
			return Get(i);
		}

		/// <summary>
		/// Get the next token on channel.
		/// </summary>
		/// <param name="i">The token index.</param>
		/// <returns></returns>
		protected int NextTokenOnChannel(int i)
		{
			Sync(i);
			if (i >= Size)
				return Size - 1;

			IToken token = Get(i);
			while (!IsEnabled(token.Channel))
			{
				if (token.Type == -1)
					return i;
				i++;
				Sync(i);
				token = Get(i);
			}
			return i;
		}

		/// <summary>
		/// Get the previous token on channel.
		/// </summary>
		/// <param name="i">The token index.</param>
		/// <returns></returns>
		protected int PreviousTokenOnChannel(int i)
		{
			Sync(i);
			if (i >= Size)
				return Size - 1;

			while (i >= 0)
			{
				IToken token = Get(i);
				if (token.Type == EOF || IsEnabled(token.Channel))
					return i;
				i--;
			}
			return i;
		}

		/// <summary>
		/// Check if channel is enabled.
		/// </summary>
		/// <param name="channel">The channel.</param>
		/// <returns></returns>
		private bool IsEnabled(int channel)
		{
			foreach (int matchChannel in channels)
			{
				if (matchChannel == channel)
					return true;
			}
			return false;
		}
	}
}
