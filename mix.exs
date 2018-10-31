defmodule RandomStringGenerator.Mixfile do
  use Mix.Project
  @version "0.1.1"

  def project do
    [
      app: :random_string_generator,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
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
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.9.1", only: :test, runtime: false}
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
      source_url: "https://github.com/caioceccon/random_string_generator/"
    ]
  end
end
