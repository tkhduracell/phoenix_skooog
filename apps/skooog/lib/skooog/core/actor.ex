defmodule Skooog.Core.Actor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Skooog.Core.Actor


  schema "actors" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Actor{} = actor, attrs) do
    actor
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
