# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :manager,
  ecto_repos: [Manager.Repo]

# Configures the endpoint
config :manager, ManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z2tcijKMAyhNDrxrksE2xb/EtkVP5aFSI4jhiala7m3lDC8GiI/XdtA5YzoAZ/fi",
  render_errors: [view: ManagerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Manager.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "8i35U9Lp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
