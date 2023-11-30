defmodule ExamenWeb.ChuckNorrisJSON do
  def chuck(data) do
    %{
      "id" => data["id"],
      "value" => data["value"],
      "url" => data["url"],
      "categories" => data["categories"],
      "created_at" => data["created_at"],
      "icon_url" => data["icon_url"],
      "updated_at" => data["updated_at"],
    }
  end

  def create_api_token(%{token: value}) do
    %{token: value}
  end
end
