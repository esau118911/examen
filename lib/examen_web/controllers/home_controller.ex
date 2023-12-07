defmodule ExamenWeb.HomeController do
  use ExamenWeb, :controller

  def index(conn, _params) do
    token = Application.get_env(:examen, :api_token )
    render(conn, key: token)
  end
end
