defmodule Commanded.Scheduler.Mixfile do
  use Mix.Project

  def project do
    [
      app: :commanded_scheduler,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Commanded.Scheduler.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      "event_store.reset": ["event_store.drop", "event_store.create", "event_store.init"],
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["test --no-start"],
      "test.watch": ["test.watch --no-start"]
    ]
  end

  defp deps do
    [
      {:commanded, "~> 0.17.0", runtime: false},
      {:commanded_ecto_projections, "~> 0.7"},
      {:crontab, "~> 1.1"},
      {:ecto, "~> 2.2"},
      {:ex2ms, "~> 1.5"},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:postgrex, ">= 0.0.0"},
      {:timex, "~> 3.3"},
      {:uuid, "~> 1.1"}
    ]
  end
end
