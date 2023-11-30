defmodule ExamenWeb.ApiJSON do
  def index(data) do
    %{ monto_total: data.monto_total,
       detalles_solicitud: %{
         principal: data.principal,
         tasa_anual: data.tasa_anual,
         periodos: data.periodos}
     }
  end
end
