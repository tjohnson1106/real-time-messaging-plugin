defmodule RealTime.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias RealTime.Accounts.User

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :username, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username])
    |> validate_required([:email, :username])
    |> validate_length(:username, min: 5, max: 32)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  def registration_changeset(%User{} = user, attrs) do
    user
    |> changeset(attrs)
    |> validate_confirmation(:password)
    |> cast(attrs, [:password], [])
    |> validate_length(:password, min: 5, max: 20)
    |> encrypt_password()
  end

  defp encrypt_password() do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Bcrypt.hash_pw_salt(password))

      _ ->
        changeset
    end
  end
end
