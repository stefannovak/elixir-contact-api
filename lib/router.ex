defmodule Contactapi.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  post "contact", do: send_resp(conn, 200, Jason.encode!(%{message: "Hello World"}))

  match _, do: send_resp(conn, 404, "Not Found")
end
