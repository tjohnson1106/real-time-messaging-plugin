defmodule RealTime.Accounts do
  alias RealTime.Repo
  alias RealTime.Accounts.User

  # TODO 090920191927 test creating a user in iex before you proceed

  def sign_in(email, password) do
    user = Repo.get_by(User, email: email)

    # if does not evaluate to nil or false true must be explicit to avoid CondClauseError
    cond do
      user && Bcrypt.check_pass(password, user.password_hash) ->
        {:ok, user}

      # in any other case  
      true ->
        {:error, :unauthorized}

        # cond considers any value besides nil and false to be true:cond considers any value besides nil and false to be true
    end
  end

  # if not not current user but doesn't return current user use 'do:'
  # only needs one argument(conn)
  def user_signed_in?(conn), do: !!current_user(conn)

  def current_user(conn) do
    # return current session value
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    # check for user ID
    if user_id, do: Repo.get(User, user_id)
  end

  # drop session map
  def sign_out(conn) do
    Plug.Conn.configure_session(conn, drop: true)
  end

  def register(params) do
    User.registration_changeset(%User{}, params)
    |> Repo.insert()
  end
end
