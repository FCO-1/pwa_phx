defmodule PwaPhx.Person do
  @moduledoc """
  The Person context.
  """

  import Ecto.Query, warn: false
  alias PwaPhx.Repo

  alias PwaPhx.Person.People

  @doc """
  Returns the list of persons.

  ## Examples

      iex> list_persons()
      [%People{}, ...]

  """
  def list_persons do
    Repo.all(People)
  end

  @doc """
  Gets a single people.

  Raises `Ecto.NoResultsError` if the People does not exist.

  ## Examples

      iex> get_people!(123)
      %People{}

      iex> get_people!(456)
      ** (Ecto.NoResultsError)

  """
  def get_people!(id), do: Repo.get!(People, id)

  @doc """
  Creates a people.

  ## Examples

      iex> create_people(%{field: value})
      {:ok, %People{}}

      iex> create_people(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_people(attrs \\ %{}) do
    %People{}
    |> People.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a people.

  ## Examples

      iex> update_people(people, %{field: new_value})
      {:ok, %People{}}

      iex> update_people(people, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_people(%People{} = people, attrs) do
    people
    |> People.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a people.

  ## Examples

      iex> delete_people(people)
      {:ok, %People{}}

      iex> delete_people(people)
      {:error, %Ecto.Changeset{}}

  """
  def delete_people(%People{} = people) do
    Repo.delete(people)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking people changes.

  ## Examples

      iex> change_people(people)
      %Ecto.Changeset{data: %People{}}

  """
  def change_people(%People{} = people, attrs \\ %{}) do
    People.changeset(people, attrs)
  end
end
