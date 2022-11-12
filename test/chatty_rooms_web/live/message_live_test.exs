defmodule ChattyRoomsWeb.MessageLiveTest do
  use ChattyRoomsWeb.ConnCase
  import Phoenix.LiveViewTest

  test "disconnected and connected mount", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Chatty Rooms Message Page"

    {:ok, _view, _html} = live(conn)
  end
end
