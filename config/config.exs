# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :real_time,
  ecto_repos: [RealTime.Repo]

# Configures the endpoint
config :real_time, RealTimeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sT0w78gtVI7a2uD3Wau7YdD3VY0l/7HTJS1vctEh6qKLqt4vAdhAQTT6mN6UVNbL",
  render_errors: [view: RealTimeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RealTime.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
