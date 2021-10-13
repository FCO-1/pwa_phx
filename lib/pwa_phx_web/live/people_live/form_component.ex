defmodule PwaPhxWeb.PeopleLive.FormComponent do
  use PwaPhxWeb, :live_component

  alias PwaPhx.Person

  @impl true
  def update(%{people: people} = assigns, socket) do
    changeset = Person.change_people(people)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"people" => people_params}, socket) do
    changeset =
      socket.assigns.people
      |> Person.change_people(people_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"people" => people_params}, socket) do
    save_people(socket, socket.assigns.action, people_params)
  end

  defp save_people(socket, :edit, people_params) do
    case Person.update_people(socket.assigns.people, people_params) do
      {:ok, _people} ->
        {:noreply,
         socket
         |> put_flash(:info, "People updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_people(socket, :new, people_params) do
    case Person.create_people(people_params) do
      {:ok, _people} ->
        {:noreply,
         socket
         |> put_flash(:info, "People created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
