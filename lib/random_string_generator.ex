defmodule RandomStringGenerator do
  @moduledoc """
    A Module to generate a random string based on a given string pattern

    Accepted string patterns:
      Use l for lower case letter from a to z
      Use L for upper case letter from A to Z
      Use d for digit from 0 to 9
      Use p for punctuation

    Punctuation is any character on the following group:

      @punctuation [
          "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-",
          ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^",
          "_", "`", "{", "|","}", "~"
      ]

    Generate a string containing 2 lower case letters followed by 2 digits.
      RandomStringGenerator.generate("lldd")

    Generate a string containing 2 upper case letters.
      RandomStringGenerator.generate("LL")

    **Delimiters**

    Everything that is not `l`,`L`,`d` and `p` is treated as a delimiter so the
    pattern `-dl?` is interpreted as a hyphen followed by a digit followed by
    a letter followed by a question mark.

    Generate a string containing 2 letters followed by a hyphen.
      RandomStringGenerator.generate("ll-")

    **Scape**

    In order to generate a string containing the characters `l`,`L`,`d` and `p`
    as a delimiter you need to use the backslash twice in order to scape it.

    Generate a string containing 2 digits followed by the letters `lLdp`.
      RandomStringGenerator.generate("dd\\\\l\\\\L\\\\d\\\\p")

  """

  @lower_alpha_chars ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @upper_alpha_chars ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @digits ~w(0 1 2 3 4 5 6 7 8 9)
  @punctuation [
    "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/",
    ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|",
    "}", "~"
  ]

  # TODO accept list of chars to be used as special case
  # TODO implement pattern repetition like d{1}

  @doc """
  Given a `pattern` string, returns a random generated string.

  ## Examples

      iex> str = RandomStringGenerator.generate("c-C-d")
      iex> Regex.match?(~r/[a-z]-[A-Z]-[0-9]/, str)
      true

  """
  def generate(pattern) do
    generate(pattern, "")
  end

  defp generate("", generated_string) do
    generated_string
  end

  # TODO Dry Enum.random
  defp generate("l" <> rest, generated_string) do
    generate(rest, generated_string <> Enum.random(@lower_alpha_chars))
  end

  defp generate("L" <> rest, generated_string) do
    generate(rest, generated_string <> Enum.random(@upper_alpha_chars))
  end

  defp generate("d" <> rest, generated_string) do
    generate(rest, generated_string <> Enum.random(@digits))
  end

  defp generate("p" <> rest, generated_string) do
    generate(rest, generated_string <> Enum.random(@punctuation))
  end

  defp generate("\\" <> <<pattern :: binary-size(1)>> <> rest, generated_string) do
    generate(rest, generated_string <> pattern)
  end

  defp generate(<<pattern :: binary-size(1)>> <> rest, generated_string) do
    generate(rest, generated_string <> pattern)
  end
end
