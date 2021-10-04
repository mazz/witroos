# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :witroos,
  ecto_repos: [Witroos.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :witroos, WitroosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y2im8UaJ1XNKhzvDVXkRdUJn8VtlS5V714VvQEl3wRMakb6hypSDAOtOpPwM/Qh4",
  render_errors: [view: WitroosWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Witroos.PubSub,
  live_view: [signing_salt: "HOoJMYJw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
