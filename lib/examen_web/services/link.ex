defmodule ExamenWeb.Services.Httpc do
  def get_directions() do
    url = "https://api.chucknorris.io/jokes/random"
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
        |> IO.inspect()
    end
    end
end
