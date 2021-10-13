defmodule PwaPhx.PersonTest do
  use PwaPhx.DataCase

  alias PwaPhx.Person

  describe "persons" do
    alias PwaPhx.Person.People

    @valid_attrs %{age: "120.5", name: "some name"}
    @update_attrs %{age: "456.7", name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def people_fixture(attrs \\ %{}) do
      {:ok, people} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Person.create_people()

      people
    end

    test "list_persons/0 returns all persons" do
      people = people_fixture()
      assert Person.list_persons() == [people]
    end

    test "get_people!/1 returns the people with given id" do
      people = people_fixture()
      assert Person.get_people!(people.id) == people
    end

    test "create_people/1 with valid data creates a people" do
      assert {:ok, %People{} = people} = Person.create_people(@valid_attrs)
      assert people.age == Decimal.new("120.5")
      assert people.name == "some name"
    end

    test "create_people/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Person.create_people(@invalid_attrs)
    end

    test "update_people/2 with valid data updates the people" do
      people = people_fixture()
      assert {:ok, %People{} = people} = Person.update_people(people, @update_attrs)
      assert people.age == Decimal.new("456.7")
      assert people.name == "some updated name"
    end

    test "update_people/2 with invalid data returns error changeset" do
      people = people_fixture()
      assert {:error, %Ecto.Changeset{}} = Person.update_people(people, @invalid_attrs)
      assert people == Person.get_people!(people.id)
    end

    test "delete_people/1 deletes the people" do
      people = people_fixture()
      assert {:ok, %People{}} = Person.delete_people(people)
      assert_raise Ecto.NoResultsError, fn -> Person.get_people!(people.id) end
    end

    test "change_people/1 returns a people changeset" do
      people = people_fixture()
      assert %Ecto.Changeset{} = Person.change_people(people)
    end
  end
end
