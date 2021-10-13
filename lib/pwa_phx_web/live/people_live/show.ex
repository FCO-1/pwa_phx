defmodule PwaPhxWeb.PeopleLive.Show do
  use PwaPhxWeb, :live_view

  alias PwaPhx.Person

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:people, Person.get_people!(id))}
  end

  defp page_title(:show), do: "Show People"
  defp page_title(:edit), do: "Edit People"
end
