defmodule ExamenWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: ExamenWeb.ErrorJSON)
    |> render(:"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(403)
    |> put_view(json: ExamenWeb.ErrorJSON)
    |> render(:"403")
  end

  def call(conn, {:error, :badRequest}) do
    conn
    |> put_status(400)
    |> put_view(json: ExamenWeb.ErrorJSON)
    |> render(:"400")
  end
end
