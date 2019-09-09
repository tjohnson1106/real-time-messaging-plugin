defmodule RealTimeWeb.SessionController do
  use RealTimeWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end
end
