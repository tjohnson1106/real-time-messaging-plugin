defmodule RealTimeWeb.RegistrationController do
  use RealTimeWeb, :controller

  def new(conn, _) do
    render(conn, "new.html", changeset: conn)
  end

  def create(conn, _params) do
  end
end
