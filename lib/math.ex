defmodule Math do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Math.Calculate, [])
    ]

    opts = [strategy: :one_for_one, name: Math.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
