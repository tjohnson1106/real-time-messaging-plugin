defmodule RealTime.Repo do
  use Ecto.Repo,
    otp_app: :real_time,
    adapter: Ecto.Adapters.Postgres
end
