defmodule ExamenWeb.Services.ChuckNorris do
  def get_directions() do
    url = "https://api.chucknorris.io/jokes/random"
    headers = ["Content-Type": "application/json","Accept": "Application/json; Charset=utf-8"]
    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
