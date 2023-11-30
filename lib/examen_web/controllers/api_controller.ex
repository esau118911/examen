defmodule ExamenWeb.ApiController do
  use ExamenWeb, :controller
  action_fallback ExamenWeb.FallbackController
  def index(conn, params) do
    principal  = Map.get(params, "principal")
    tasa_anual = Map.get(params, "tasa_anual")
    periodos   = Map.get(params, "periodos")
    data = InteresesCompuestos.calcular(principal, tasa_anual, periodos)
    with {:ok, data} <- data do
      render(conn, data)
    end
  end
end
