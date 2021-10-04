defmodule Witroos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Witroos.Repo,
      # Start the Telemetry supervisor
      WitroosWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Witroos.PubSub},
      # Start the Endpoint (http/https)
      WitroosWeb.Endpoint
      # Start a worker by calling: Witroos.Worker.start_link(arg)
      # {Witroos.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Witroos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WitroosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
