defmodule RealTimeWeb.RoomChannel do
  use RealTimeWeb, :channel

  def join("room" <> room_id, _params, socket) do
    {:ok, %{channel: "room:#{room_id}"}, assign(socket, :room_id, room_id)}
  end

  def handle_in("message:add", %{"message" => body}, socket) do
    room_id = socket.assigns[:room_id]
    broadcast!(socket, "room:#{room_id}:new_message", %{body: body})
    {:reply, :ok, socket}
  end
end
