defmodule ExamenWeb.ChuckNorrisController do
  use ExamenWeb, :controller
  action_fallback ExamenWeb.FallbackController
  alias ExamenWeb.Services.ChuckNorris

  def chuck(conn, _params) do
    with {:ok, data} <- ChuckNorris.get_directions() do
      render(conn, data)
    else
      _ ->
        {:error, "Error desconocido"}
    end
  end

end
