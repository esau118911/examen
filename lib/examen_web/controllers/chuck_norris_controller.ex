defmodule ExamenWeb.ChuckNorrisController do
  use ExamenWeb, :controller
  action_fallback ExamenWeb.FallbackController
  alias ExamenWeb.Services.Httpc

  def chuck(conn, _params) do
    Httpc.get_directions("https://api.chucknorris.io/jokes/random")
      |> case do
        {:ok, data} ->
          render(conn, data)
        _  -> {:error, "Error desconocido"}
        end
  end

end
