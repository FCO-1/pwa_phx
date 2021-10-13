defmodule PwaPhxWeb.PeopleLive.Index do
  use PwaPhxWeb, :live_view

  alias PwaPhx.Person
  alias PwaPhx.Person.People

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :persons, list_persons())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit People")
    |> assign(:people, Person.get_people!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New People")
    |> assign(:people, %People{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Persons")
    |> assign(:people, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    people = Person.get_people!(id)
    {:ok, _} = Person.delete_people(people)

    {:noreply, assign(socket, :persons, list_persons())}
  end

  defp list_persons do
    Person.list_persons()
  end
end
