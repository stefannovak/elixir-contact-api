defmodule Contactapi.Application do
  use Application

  @impl true

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Contactapi.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: Contactapi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
