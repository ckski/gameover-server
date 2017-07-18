defmodule GameoverServer do
  
  require Logger


  def start(_type, _args) do
    GameoverServer.Supervisor.start_link()
  end
end
