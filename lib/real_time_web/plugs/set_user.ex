defmodule RealTimeWeb.Plugs.SetUser do
  import Plug.Conn

  alias RealTime.Repo
  alias RealTime.Accounts.User

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)

    cond do
      current_user = user_id && Repo.get(User, user_id) ->
        token = Phoenix.Token.sign(conn, "user token", user_id)

        conn
        |> assign(:current_user, current_user)
        |> assign(:signed_in?, true)
        |> assign(:user_token, token)

      true ->
        conn
        |> assign(:current_user, nil)
        |> assign(:signed_in?, false)
    end
  end
end
