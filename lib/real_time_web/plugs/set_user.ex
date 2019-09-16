defmodule RealTimeWeb.Plugs.SetUser do
  import Plug.Conn

  alias RealTime.Repo
  alias RealTime.Accounts.User

  def init(_params) do
  end

  def call(conn, _params) do
  end
end
