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

  def call(conn, {:error, :internalServerError}) do
    conn
    |> put_status(500)
    |> put_view(json: ExamenWeb.ErrorJSON)
    |> render(:"500")
  end

  def call(conn, {:error, :invalid_request}) do
    conn
    |> put_status(400)
    |> put_view(html: ExamenWeb.ErrorHTML)
    |> render(:"400")
  end

  def call(conn, {:error, msg}) do
    conn
    |> put_status(400)
    |> put_view(html: ExamenWeb.ErrorHTML)
    |> render(:"400", %{error: msg})
  end

  def call(conn, {:error, msg}) do
    conn
    |> put_status(400)
    |> put_view(json: ExamenWeb.ErrorJSON)
    |> render(:"400", %{error: msg})
  end
end
