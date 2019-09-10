defmodule RealTime.Accounts do
  alias RealTime.Repo
  alias RealTime.Accounts.User

  # TODO 090920191927 test creating a user in iex before you proceed

  def sign_in(email, password) do
    user = Repo.get_by(User, email: email)

    # if does not evaluate to nil or false true must be explicit to avoid CondClauseError
    cond do
      user && user.password_hash == password ->
        {:ok, user}

      # in any other case  
      true ->
        {:error, :unauthorized}

        # cond considers any value besides nil and false to be true:cond considers any value besides nil and false to be true
    end
  end
end
