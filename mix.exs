defmodule Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: ".",
      apps: [:skooog],
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp deps do
    []
  end
end