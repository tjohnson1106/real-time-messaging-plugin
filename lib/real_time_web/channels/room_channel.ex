defmodule RealTimeWeb.RoomChannel do
  use RealTimeWeb, :channel

  def join(channel_name, _params, socket) do
    {:ok, %{channel: channel_name}, socket}
  end

  def handle_in("message:add", %{"message" => body}, socket) do
    broadcast!(socket, "room:general:new_message", %{body: body})
    {:reply, :ok, socket}
  end
end
