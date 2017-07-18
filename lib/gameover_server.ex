defmodule GameoverServer do
  
  require Logger


  def start(_type, _args) do
    Logger.info("started")
    GameoverServer.Supervisor.start_link()
  end
end
