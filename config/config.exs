# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bsb,
  ecto_repos: [Bsb.Repo]

# Configures the endpoint
config :bsb, BsbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q97kvJFHhu2m3L5e43NWS0CtgRgpM/P8qqX3LapD4VckB/LwU+sAIZwHuJSSbLKz",
  render_errors: [view: BsbWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bsb.PubSub,
  live_view: [signing_salt: "EzVb+0w9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :bsb, Bsb.Repo,
  start_apps_before_migration: [:logger]