defmodule Ehismgo.Repo do
  use Ecto.Repo,
    otp_app: :ehismgo,
    adapter: Ecto.Adapters.Postgres
end
