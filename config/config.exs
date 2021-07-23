# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :homebridge_web_switch, HomebridgeWebSwitchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c4wqZKSuob4i6Nn8ZeuAVCYfXLW+hcoqkqiEGHM6D0yyhWkaUYEehu+QzMzLs9H/",
  render_errors: [view: HomebridgeWebSwitchWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HomebridgeWebSwitch.PubSub,
  live_view: [signing_salt: "TKunuGes"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# CEC Config
config :homebridge_web_switch, HomebridgeWebSwitchWeb.API.TVSwitchController,
  cec_address: System.get_env("CEC_ADDRESS", "0.0.0.0")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
