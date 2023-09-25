defmodule Ehismgo.RepoMgo do
  use Ecto.Repo,
    otp_app: :ehismgo,
    adapter: Mongo.Ecto
end
