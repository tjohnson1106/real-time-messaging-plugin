defmodule RealTime.Talk do
  alias RealTime.Repo
  alias RealTime.Talk.Room

  def list_rooms() do
    Repo.all(Room)
  end

  def change_room(%Room{} = room) do
    Room.changeset(room, %{})
  end

  def create_room(attrs \\ %{}) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def get_room!(id), do: Repo.get!(Room, id)
end
