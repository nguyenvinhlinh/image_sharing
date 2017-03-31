# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :image_sharing,
  ecto_repos: [ImageSharing.Repo]

# Configures the endpoint
config :image_sharing, ImageSharing.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TgAA4SdTUD8aCO9hW522/Q+N4dp/lIbRkTrN0NcsSWhh6bHKrr9WH1aEvqoanzVS",
  render_errors: [view: ImageSharing.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ImageSharing.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
