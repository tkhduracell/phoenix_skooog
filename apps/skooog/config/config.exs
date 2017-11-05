# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :skooog,
  ecto_repos: [Skooog.Repo]

# Configures the endpoint
config :skooog, SkooogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wfvzXPnl0jnr5CNPgx2k7QXeAXuwVfJ39QvxXm288id2rpJKEJR5uWo9JfXfSyIR",
  render_errors: [view: SkooogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Skooog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Todo",
  ttl: { 30, :days},
  verify_issuer: true,
  secret_key: "<your secret guardian key>",
  serializer: Skooog.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
