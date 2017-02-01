use Mix.Config

config :touch_recorder_web, TouchRecorderWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "sheltered-fjord-46378.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: "d6G6LcGpHlMzMneBy7z3Lx0e4dh2FCPtGA4NjTFCSTfi3MEpvamQT9/9hlndejWA"

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :touch_recorder_web, TouchRecorderWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
