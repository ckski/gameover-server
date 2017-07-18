defmodule GameoverServer.Mixfile do
  use Mix.Project

  def project do
    [app: :gameover_server,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,

     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [applications: [:cowboy, :logger],
     mod: {GameoverServer, []}]
  end

  defp deps do
    [{:cowboy, github: "ninenines/cowboy", tag: "2.0.0-pre.9"},
     {:poison, "~> 3.1"}]
  end
end
