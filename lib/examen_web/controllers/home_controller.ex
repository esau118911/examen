defmodule ExamenWeb.HomeController do
  use ExamenWeb, :controller
  action_fallback ExamenWeb.FallbackController
  alias ExamenWeb.Services.Httpc

  def index(conn, _params) do
    render(conn, %{data: %{"monto_total" => 0}, error: ""})
  end

  def chuck(conn, _params) do
    render(conn, %{data: %{}, error: ""})
  end

  def calcular(conn, params) do
    data_params = %{"principal" => String.to_integer(Map.get(params, "principal")),
                    "tasa_anual" => String.to_integer(Map.get(params, "tasa_anual")),
                    "periodos" => String.to_integer(Map.get(params, "periodos")),
                  }
    Httpc.post_directions("http://localhost:4000/services/calcular-intereses", data_params)
    |> case do
        {:ok, data} ->
          conn
            |> render(:index, %{data: data, error: "" })
        {:error, _ } ->
          conn
            |> assign(:data, %{})
            |> render(:index, %{error: "Error de Solicitud"})
       end
  end

  def chuck_norris(conn, params) do
    Httpc.get_directions("http://localhost:4000/services/chuck-norris")
      |> case do
          {:ok, data} ->
            conn
              |> render(:chuck, %{data: data, error: "" })
              {:error, _ } ->
                conn
                  |> assign(:data, %{})
                  |> render(:chuck, %{error: "Error de Solicitud"})
         end
  end
end
