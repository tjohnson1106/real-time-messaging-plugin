defmodule RealTimeWeb.RegistrationController do
  use RealTimeWeb, :controller

  def new(conn, _) do
    render(conn, "new.html", changeset: conn)
  end

  def create(conn, params) do
    inspect(params)
    conn
  end
end
