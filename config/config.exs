# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configures the endpoint
config :prokeep_web, ProkeepWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FrW47w3fKyhTezjUC0Cns/qWJFxXsfoy+NMCQ/RgxpYjEYcU4xjXDMK/qUrXvrpk",
  render_errors: [view: ProkeepWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ProkeepWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "wFx0L/QC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
