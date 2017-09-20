defmodule RandomStringGenerator.Mixfile do
  use Mix.Project
  @version "0.1.1"

  def project do
    [
      app: :random_string_generator,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp description do
    """
    Generate a random string based on a given string pattern.
    """
  end

  defp package do
    [
      files: ["lib", "test", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Caio Ceccon"],
      licenses: ["GNU General Public License v3.0"],
      links: %{"GitHub" => "https://github.com/caioceccon/random_string_generator"}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      extras: ["README.md"],
      main: "readme",
      source_url: "https://github.com/caioceccon/random_string_generator/",
    ]
  end
end
