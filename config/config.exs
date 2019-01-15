# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :abacus_api,
  ecto_repos: [AbacusApi.Repo]

# Configures the endpoint
config :abacus_api, AbacusApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "E/mRy8dpt5ROz3+Tjb2+JWS/9V4R6K99WA91/eb+QRg94gOs6xNXP3hEBkRPnay7",
  render_errors: [view: AbacusApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AbacusApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
