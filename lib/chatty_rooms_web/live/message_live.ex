defmodule ChattyRoomsWeb.MessageLive do
  use ChattyRoomsWeb, :live_view
  alias ChattyRooms.Message

def mount(_params, _session, socket) do
  messages = Message.list_messages() |> Enum.reverse()
  changeset = Message.changeset(%Message{}, %{})
  {:ok, assign(socket, changeset: changeset, messages: messages)}
end

  def render(assigns) do
    ChattyRoomsWeb.MessageView.render("messages.html", assigns)
  end
end
