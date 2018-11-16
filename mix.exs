defmodule UeberauthGoodreads.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ueberauth_goodreads,
      version: "0.1.0",
      name: "Ueberauth Goodreads Strategy",
      description: "An Uberauth strategy for Goodreads authentication.",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package(),
      deps: deps()
   ]
  end

  defp package do
    [files: ["lib", "mix.exs", "README.md", "LICENSE"],
     maintainers: ["Tyler Clemens"],
     licenses: ["MIT"],
     links: %{"GitHub": "https://github.com/tielur/ueberauth_goodreads"}]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpoison, :oauth2, :ueberauth]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:oauth2, "~> 0.8"},
      {:poison, "~> 3.0 or ~> 4.0"},
      {:ueberauth, "~> 0.5"},
      {:sweet_xml, "~> 0.6.5"},
      {:credo, "~> 0.10", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
