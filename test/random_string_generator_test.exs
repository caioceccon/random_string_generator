defmodule RandomStringGeneratorTest do
  use ExUnit.Case
  doctest RandomStringGenerator

  test "generate a random string with the right size" do
    assert String.length(RandomStringGenerator.generate("Cccdp")) == 5
  end

  test "generate a random lower case character" do
    str = RandomStringGenerator.generate("l")
    assert Regex.match?(~r/[a-z]/, str) == true
  end

  test "generate a random upper case character" do
    str = RandomStringGenerator.generate("L")
    assert Regex.match?(~r/[A-Z]/, str) == true
  end

  test "generate a random digit" do
    str = RandomStringGenerator.generate("d")
    assert Regex.match?(~r/[0-9]/, str) == true
  end

  test "generate a random punctuation" do
    str = RandomStringGenerator.generate("p")
    assert Regex.match?(~r/[\p{P}\p{S}]/, str) == true
  end

  test "generate a custom char" do
    custom_list = ["+", "-", "/", "*"]
    char = RandomStringGenerator.generate("c", custom_list)
    assert Enum.member?(custom_list, char) == true
  end

  test "accept any delimiter" do
    str = RandomStringGenerator.generate("d-")
    assert Regex.match?(~r/[0-9]-/, str) == true
  end

  test "accept utf8 delimiter" do
    assert RandomStringGenerator.generate("ááàã") == "ááàã"
  end

  test "accept scape character" do
    str = RandomStringGenerator.generate("\\d-")
    assert Regex.match?(~r/d-/, str) == true
  end
end
