defmodule ExamenWeb.ChuckNorrisController do
  use ExamenWeb, :controller
  action_fallback ExamenWeb.FallbackController
  alias Examen.Accounts
  alias ExamenWeb.Services.ChuckNorris

  def chuck(conn, _params) do
    with {:ok, data} <- ChuckNorris.get_directions() do
      render(conn, data)
    end
  end

  def create_api_token(conn, _params) do
    user = Accounts.get_user_by_email("narvaez_1189@hotmail.com")
    token = Accounts.create_user_api_token(user)
    render(conn, %{token: token})
  end
end
