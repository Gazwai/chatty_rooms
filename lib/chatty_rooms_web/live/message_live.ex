defmodule ChattyRoomsWeb.MessageLive do
  use ChattyRoomsWeb, :live_view
  alias ChattyRooms.Message
  alias ChattyRooms.PubSub

  def mount(_params, _session, socket) do
    if connected?(socket), do: Message.subscribe()

    messages = Message.list_messages() |> Enum.reverse()
    changeset = Message.changeset(%Message{}, %{})

    {:ok, assign(socket, messages: messages, changeset: changeset),
    temporary_assigns: [messages: []]}
  end

  def render(assigns) do
    ChattyRoomsWeb.MessageView.render("messages.html", assigns)
  end

  def handle_event("new_message", %{"message" => params}, socket) do
    case Message.create_message(params) do
      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}

      # broadcast returns :ok (just the atom!) if there are no errors
      :ok ->
        changeset = Message.changeset(%Message{}, %{"name" => params["name"]})
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_info({:message_created, message}, socket) do
    {:noreply, assign(socket, messages: [message])}
  end
end
