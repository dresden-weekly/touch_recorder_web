# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :touch_recorder_web,
  ecto_repos: [TouchRecorderWeb.Repo]

# Configures the endpoint
config :touch_recorder_web, TouchRecorderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C1S95zndaHgH7k9BEHwLGOF0X1151l+8KBUBCuomxOR51ZUyhdCoarPO1SUOxKRq",
  render_errors: [view: TouchRecorderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TouchRecorderWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
