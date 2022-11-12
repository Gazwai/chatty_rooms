defmodule ChattyRoomsWeb.PageController do
  use ChattyRoomsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
