defmodule ChattyRooms.Repo do
  use Ecto.Repo,
    otp_app: :chatty_rooms,
    adapter: Ecto.Adapters.Postgres
end
