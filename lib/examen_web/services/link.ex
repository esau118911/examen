defmodule ExamenWeb.Services.Httpc do
  def get_directions(url) do
    :inets.start()
    :ssl.start()
    headers = [{'accept', 'application/json'}]

    http_request_opts = [
      ssl: [
        verify: :verify_peer,
        cacerts: :public_key.cacerts_get(),
        customize_hostname_check: [
          match_fun: :public_key.pkix_verify_hostname_match_fun(:https)
        ]
      ]
    ]
    case :httpc.request(:get, {url, headers}, http_request_opts, []) do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        body
        |> Jason.decode
    end
    end

  def post_directions(url, data) do
    :inets.start()
    :ssl.start()
    route = "http://localhost:4000#{url}"
    headers = [{'accept', 'application/json'},{'Authorization', 'Bearer kKfKViS6DbDl9kUIydGk3rVpVPYYB43DFYN7gJ9brZ8'}]
    encode = Jason.encode!(data)
    :httpc.request(:post, {route,  headers, 'application/json', encode}, [], [])
    |> case do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        body
          |> Jason.decode()
      { :error, :invalid_request} -> {:error, "Error en Envio de datos"}
      { :error, errors } -> {:error, errors}
      end
   end
end
