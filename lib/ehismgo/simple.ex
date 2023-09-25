defmodule Ehismgo.Simple do
  import Ecto.Query

  alias Ehismgo.Weather
  alias Ehismgo.RepoMgo

  def sample_query do
    query =
      from w in Weather,
        where: w.prcp > 0 or is_nil(w.prcp),
        select: w

    RepoMgo.all(query)
  end
end
