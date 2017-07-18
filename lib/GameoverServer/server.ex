defmodule GameoverServer.Server do
  use GenServer

  require Logger

  @port 80

  defstruct web_server: nil

  def start_link(args, opts) do
    GenServer.start_link(__MODULE__, args, opts)
  end

  def init(args) do
    Logger.info("Web server started. Listening on port #{inspect @port}")
    dispatch = :cowboy_router.compile([
      {:_, [{"/health", __MODULE__.Health, %{}}, {"/", :cowboy_static, {:priv_file, :gameover_server, "assets/index.html"}}]},
    ])

    {:ok, _} = :cowboy.start_clear(:http, 100, [port: @port], %{:env => %{:dispatch => dispatch}})  # TODO: pass in port?
    {:ok, %__MODULE__{}}
  end

  defmodule Health do
    def init(req, state) do
      Logger.info("Got request: #{inspect req}")
      req = :cowboy_req.reply(200, %{"content-type" => "text/plain"}, "status: up", req)
          # req = :cowboy_req.reply(204, %{}, "", req)
      {:ok, req, state}
    end
  end

end