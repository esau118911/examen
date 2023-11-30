defmodule InteresesCompuestos do
  def calcular(principal, tasa_anual, periodos) do
    with principal when not is_nil(principal) <- validate_integer(principal),
         tasa_anual when  not is_nil(tasa_anual) <- validate_float(tasa_anual),
         periodos when  not is_nil(periodos) <- validate_integer(periodos) do
    monto_total = Float.round(principal * Float.pow(1 + tasa_anual, periodos),2)
    {:ok,
      %{
        monto_total: monto_total,
        principal: principal,
        tasa_anual: tasa_anual,
        periodos: periodos
      }
    }
    else
      nil ->
        {:error, :badRequest}
    end
  end
  def validate_float(valor) do
    if is_float(valor) do
      valor
    else
      nil
    end

  end

  def validate_integer(valor) do
    if is_integer(valor) do
      valor
    else
      nil
    end
  end

end
