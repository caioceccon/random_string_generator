defmodule RandomStringGenerator do
  @moduledoc """
    A Module to generate a random string based on a given string pattern.
  """
  @lower_letter "l"
  @upper_letter "L"
  @digit "d"
  @punctuation "p"
  @scape "\\"
  @custom_char "c"

  @lower_alpha_chars ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @upper_alpha_chars ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @digits ~w(0 1 2 3 4 5 6 7 8 9)
  @punctuations [
    "!",
    "\"",
    "#",
    "$",
    "%",
    "&",
    "'",
    "(",
    ")",
    "*",
    "+",
    ",",
    "-",
    ".",
    "/",
    ":",
    ";",
    "<",
    "=",
    ">",
    "?",
    "@",
    "[",
    "\\",
    "]",
    "^",
    "_",
    "`",
    "{",
    "|",
    "}",
    "~"
  ]

  @doc """
  Given a `pattern` string, returns a random generated string.

  ## Examples

      iex> str = RandomStringGenerator.generate("l-L-d")
      iex> Regex.match?(~r/[a-z]-[A-Z]-[0-9]/, str)
      true

  """
  @spec generate(String.t(), List) :: String.t()
  def generate(pattern, custom_chars \\ []) when is_binary(pattern) do
    generate(pattern, custom_chars, "")
  end

  @doc """
  Given a `pattern` string it shuffles it to a random order, so that it can be
  used for the case where the string must contain certain characters but must
  be generated in random order.

  ## Examples

      iex> pattern = "lLdp-"
      iex> shuffled_pattern = RandomStringGenerator.shuffle(pattern)
      iex>  String.graphemes(pattern) |> Enum.sort ==
      iex>  String.graphemes(shuffled_pattern) |> Enum.sort
      true

  """
  @spec shuffle(String.t()) :: String.t()
  def shuffle(pattern) when is_binary(pattern) do
    pattern
    |> String.graphemes()
    |> Enum.shuffle()
    |> Enum.join()
  end

  @spec generate(String.t(), String.t()) :: String.t()
  defp generate("", _custom_chars, generated_string) do
    generated_string
  end

  # TODO Dry Enum.random
  defp generate(@lower_letter <> rest, options, generated_string) do
    generate(rest, options, generated_string <> Enum.random(@lower_alpha_chars))
  end

  defp generate(@upper_letter <> rest, options, generated_string) do
    generate(rest, options, generated_string <> Enum.random(@upper_alpha_chars))
  end

  defp generate(@digit <> rest, options, generated_string) do
    generate(rest, options, generated_string <> Enum.random(@digits))
  end

  defp generate(@punctuation <> rest, options, generated_string) do
    generate(rest, options, generated_string <> Enum.random(@punctuations))
  end

  defp generate(@custom_char <> rest, [], generated_string) do
    generate(rest, [], generated_string <> @custom_char)
  end

  defp generate(@custom_char <> rest, custom_chars, generated_string) do
    generate(rest, custom_chars, generated_string <> Enum.random(custom_chars))
  end

  defp generate(@scape <> <<pattern::binary-size(1)>> <> rest, options, generated_string) do
    generate(rest, options, generated_string <> pattern)
  end

  defp generate(<<pattern::binary-size(1)>> <> rest, options, generated_string) do
    generate(rest, options, generated_string <> pattern)
  end
end
