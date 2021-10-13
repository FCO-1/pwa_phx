defmodule PwaPhx.Person.People do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :age, :decimal
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(people, attrs) do
    people
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
