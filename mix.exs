Code.ensure_loaded?(Hex) and Hex.start()

defmodule Linguist.Mixfile do
  use Mix.Project

  def project do
    [
      app: :linguist,
      version: "0.2.1",
      compilers: Mix.compilers(),
      elixir: "~> 1.6",
      deps: deps(),
      package: [
        contributors: ["Will Barrett, Chris McCord"],
        licenses: ["MIT"],
        links: %{github: "https://github.com/change/linguist"}
      ],
      description: """
      Elixir Internationalization library, extended to support translation files in the rails-i18n format
      """
    ]
  end

  def application do
    [applications: [:yaml_elixir]]
  end

  defp deps do
    [
      {:ex_cldr, "~> 2.0"},
      {:ex_cldr_dates_times, "~> 2.0"},
      {:ex_cldr_lists, "~> 2.0"},
      {:ex_cldr_territories, "~> 2.0"},
      {:ex_cldr_units, "~> 3.0"},
      {:jason, "~> 1.1"},
      {:yaml_elixir, "~> 2.0"},
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end
end
