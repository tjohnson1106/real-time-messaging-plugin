defmodule RealTimeWeb.RoomController do
  use RealTimeWeb, :controller

  alias RealTime.Talk.Room
  alias RealTime.Talk

  def index(conn, _params) do
    rooms = Talk.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}) do
    case Talk.create_room(room_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Room Created!")
        |> redirect(to: Routes.room_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    room = Talk.get_room!(id)
    render(conn, "show.html", room: room)
  end
end
