use Mix.Config

config :abacus_api, AbacusApiWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: "abacus-api.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")
  
# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :abacus_api, AbacusApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true