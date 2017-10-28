defmodule Skooog.Core.Object do
  use Ecto.Schema
  import Ecto.Changeset
  alias Skooog.Core.Object

  schema "objects" do
    field :type, ObjectTypeEnum
    field :business_status, ObjectBusinessStatusEnum
    field :area, :decimal
    field :deforestation_confirmed_date, :date
    field :deforestation_submission_date, :date
    field :location, :string
    field :preliminary_volume, :decimal
    field :sticks, :boolean, default: false
    field :sticks_volume, :decimal
    field :supplier, :string
    field :buyer_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Object{} = object, attrs) do
    object
    |> cast(attrs, [:type, :business_status, :supplier, :location, :deforestation_submission_date, :deforestation_confirmed_date, :area, :preliminary_volume, :sticks, :sticks_volume])
    |> validate_required([:type, :business_status, :supplier, :location, :deforestation_submission_date, :deforestation_confirmed_date, :area, :preliminary_volume, :sticks, :sticks_volume])
  end
end
