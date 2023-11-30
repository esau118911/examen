defmodule ExamenWeb.HomeController do
  use ExamenWeb, :controller

  def index(conn, _params) do
    #IO.inspect("hola")
    render(conn, nombre: "Esau Hernandez")
  end
end
