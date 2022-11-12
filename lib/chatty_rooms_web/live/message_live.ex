defmodule ChattyRoomsWeb.MessageLive do
  use ChattyRoomsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ChattyRoomsWeb.MessageView.render("messages.html", assigns)
  end
end
