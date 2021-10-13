defmodule PwaPhxWeb.PeopleLiveTest do
  use PwaPhxWeb.ConnCase

  import Phoenix.LiveViewTest

  alias PwaPhx.Person

  @create_attrs %{age: "120.5", name: "some name"}
  @update_attrs %{age: "456.7", name: "some updated name"}
  @invalid_attrs %{age: nil, name: nil}

  defp fixture(:people) do
    {:ok, people} = Person.create_people(@create_attrs)
    people
  end

  defp create_people(_) do
    people = fixture(:people)
    %{people: people}
  end

  describe "Index" do
    setup [:create_people]

    test "lists all persons", %{conn: conn, people: people} do
      {:ok, _index_live, html} = live(conn, Routes.people_index_path(conn, :index))

      assert html =~ "Listing Persons"
      assert html =~ people.name
    end

    test "saves new people", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.people_index_path(conn, :index))

      assert index_live |> element("a", "New People") |> render_click() =~
               "New People"

      assert_patch(index_live, Routes.people_index_path(conn, :new))

      assert index_live
             |> form("#people-form", people: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#people-form", people: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.people_index_path(conn, :index))

      assert html =~ "People created successfully"
      assert html =~ "some name"
    end

    test "updates people in listing", %{conn: conn, people: people} do
      {:ok, index_live, _html} = live(conn, Routes.people_index_path(conn, :index))

      assert index_live |> element("#people-#{people.id} a", "Edit") |> render_click() =~
               "Edit People"

      assert_patch(index_live, Routes.people_index_path(conn, :edit, people))

      assert index_live
             |> form("#people-form", people: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#people-form", people: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.people_index_path(conn, :index))

      assert html =~ "People updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes people in listing", %{conn: conn, people: people} do
      {:ok, index_live, _html} = live(conn, Routes.people_index_path(conn, :index))

      assert index_live |> element("#people-#{people.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#people-#{people.id}")
    end
  end

  describe "Show" do
    setup [:create_people]

    test "displays people", %{conn: conn, people: people} do
      {:ok, _show_live, html} = live(conn, Routes.people_show_path(conn, :show, people))

      assert html =~ "Show People"
      assert html =~ people.name
    end

    test "updates people within modal", %{conn: conn, people: people} do
      {:ok, show_live, _html} = live(conn, Routes.people_show_path(conn, :show, people))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit People"

      assert_patch(show_live, Routes.people_show_path(conn, :edit, people))

      assert show_live
             |> form("#people-form", people: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#people-form", people: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.people_show_path(conn, :show, people))

      assert html =~ "People updated successfully"
      assert html =~ "some updated name"
    end
  end
end
