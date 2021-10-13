defmodule PwaPhx.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string
      add :age, :decimal

      timestamps()
    end

  end
end
