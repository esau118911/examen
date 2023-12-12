defmodule ExamenWeb.HomeController do
  use ExamenWeb, :controller
  action_fallback ExamenWeb.FallbackController
  alias ExamenWeb.Services.Httpc

  def index(conn, _params) do
    token = Application.get_env(:examen, :api_token )
    render(conn, %{key: token, data: %{"monto_total" => 0}, error: ""})
  end

  def calcular(conn, params) do
    data_params = %{"principal" => String.to_integer(Map.get(params, "principal")),
                    "tasa_anual" => String.to_integer(Map.get(params, "tasa_anual")),
                    "periodos" => String.to_integer(Map.get(params, "periodos")),
                  }
    Httpc.post_directions("/services/calcular-intereses", data_params)
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
end
