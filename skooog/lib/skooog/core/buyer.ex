defmodule Skooog.Core.Buyer do
  use Ecto.Schema
  import Ecto.Changeset
  alias Skooog.Core.Buyer


  schema "buyers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Buyer{} = buyer, attrs) do
    buyer
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
