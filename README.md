# RandomStringGenerator

**A module to generate a random string based on a given string pattern**

## Installation

The package can be installed by adding `random_string_generator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:random_string_generator, "~> 0.1.1"}
  ]
end
```

## Usage

#### Accepted string patterns:

  Use `l` for lower case letter from a to z

  Use `L` for upper case letter from A to Z

  Use `d` for digit from 0 to 9

  Use `p` for punctuation

#### Punctuation is any character on the following group:

  `!`, `"`, `#`, `$`, `%`, `&`, `'`, `(`, `)`, `*`, `+`, `,`, `-`,
  `.`, `/`, `:`, `;`, `<`, `=`, `>`, `?`, `@`, `[`, ` \ `, `]`, `^`,
  `_`, `{`, `|`,`}`, `~` and `` ` ``

##### Generate a string containing 2 lower case letters followed by 2 digits.
```elixir
iex> RandomStringGenerator.generate("lldd")
"ol68"
```

##### Generate a string containing 2 upper case letters.
```elixir
iex> RandomStringGenerator.generate("LL")
"VR"
```

##### Generate a string containing 2 punctuations.
```elixir
iex> RandomStringGenerator.generate("pp")
"?!"
```

**Delimiters**

  Everything that is not `l`,`L`,`d` and `p` is treated as a delimiter so the
  pattern `-dl?` is interpreted as a hyphen followed by a digit followed by
  a lower case letter followed by a question mark.

##### Generate a string containing 2 letters followed by a hyphen.
```elixir
iex> RandomStringGenerator.generate("ll-")
"yz-"
```

**Scape**

  In order to generate a string containing the characters `l`,`L`,`d` and `p`
  as a delimiter you need to use the backslash twice in order to scape it.

##### Generate a string containing 2 digits followed by the letters `lLdp`.
```elixir
iex> RandomStringGenerator.generate("dd\\l\\L\\d\\p")
"39lLdp"
```

Full documentation at [https://hexdocs.pm/random_string_generator](https://hexdocs.pm/random_string_generator).

