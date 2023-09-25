defmodule Ehismgo.Weather do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "weather" do
    # Defaults to type :string
    field :city
    field :temp_lo, :integer
    field :temp_hi, :integer
    field :prcp, :float, default: 0.0
  end
end
