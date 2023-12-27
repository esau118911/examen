defmodule Examen.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "person" do
    field :name, :string
    field :age, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
