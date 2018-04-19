defmodule ExCluster.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_cluster,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExCluster.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 2.3"}
      #{:libcluster, github: "freandre/libcluster"}
    ]
  end
end
