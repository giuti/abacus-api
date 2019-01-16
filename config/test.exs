use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :abacus_api, AbacusApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :abacus_api, AbacusApi.Repo,
  username: "postgres",
  password: "0000",
  database: "abacus_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure bcrypt
config :bcrypt_elixir, :log_rounds, 4
