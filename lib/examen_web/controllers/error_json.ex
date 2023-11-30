defmodule ExamenWeb.ErrorJSON do
  # If you want to customize a particular status code,
  # you may add your own clauses, such as:
  #
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def render("404.json", _assigns) do
    %{
      error: %{
        code: 404,
        msg: "Page Not Found"
      }
    }
  end
  def render("500.json", _assigns) do
    %{
      "error" => %{
        "code" => 500,
        "msg" => "Internal Error"
      }
    }
  end
  def render("403.json", _assigns) do
    %{
      "error" => %{
        "code" => 403,
        "msg" => "unauthorized"
      }
    }
  end
  def render(template, _assigns) do

    %{error: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
