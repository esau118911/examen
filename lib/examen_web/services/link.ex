defmodule ExamenWeb.Services.Httpc do
  def get_directions(url) do
    :inets.start()
    :ssl.start()
    token = Application.get_env(:examen, :api_token )
    headers = [{'accept', 'application/json'},{'Authorization', 'Bearer #{token}'}]

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
          |> IO.inspect
      {:ok, {{'HTTP/1.1', 500, 'OK'}, _headers, body}} ->
        {:error, "Internal Server Error"}
      {:ok, {{~c"HTTP/1.1", 404, ~c"Not Found"}, _headers, body}} ->
        {:error, :not_found}
      {:error, errors } -> {:error, errors}
    end
  end

  def post_directions(url, data) do
    :inets.start()
    :ssl.start()
    token = Application.get_env(:examen, :api_token )
    headers = [{'accept', 'application/json'},{'Authorization', 'Bearer #{token}' }]
    encode = Jason.encode!(data)
    :httpc.request(:post, {url,  headers, 'application/json', encode}, [], [])
    |> case do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        body
          |> Jason.decode
      {:ok, {{'HTTP/1.1', 500, 'OK'}, _headers, body}} ->
        {:error, "Internal Server Error"}
      {:ok, {{'HTTP/1.1', 401, 'Unauthorized'}, _headers, body}} ->
        {:error, "Unauthorized"}
      {:error, :invalid_request} -> {:error, "Error en Envio de datos"}
      {:error, errors } -> {:error, errors}
      end
   end
end
