defmodule Contactapi.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug CORSPlug, origin: &allowed_origins/1

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  post "contact", do: send_resp(conn, 200, Jason.encode!(%{message: "Hello World"}))

  match _, do: send_resp(conn, 404, "Not Found")

  defp allowed_origins(origin) do
    origin in ["http://localhost:3000", "https://www.stefanalexnovak.com"]
  end
end
