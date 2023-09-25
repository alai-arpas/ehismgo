defmodule Ehismgo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EhismgoWeb.Telemetry,
      # Start the Ecto repository
      Ehismgo.RepoMgo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ehismgo.PubSub},
      # Start Finch
      {Finch, name: Ehismgo.Finch},
      # Start the Endpoint (http/https)
      EhismgoWeb.Endpoint
      # Start a worker by calling: Ehismgo.Worker.start_link(arg)
      # {Ehismgo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ehismgo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EhismgoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
