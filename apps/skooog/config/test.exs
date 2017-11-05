use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :skooog, SkooogWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :skooog, Skooog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "skooog_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# comeonin config 
config :argon2_elixir,
  t_cost: 2,
  m_cost: 12