defmodule Skooog.Core.Object do
  use Ecto.Schema
  import Ecto.Changeset
  alias Skooog.Core.Object

  schema "objects" do
    field :type, ObjectTypeEnum
    field :business_status, ObjectBusinessStatusEnum
    field :delegation_status, ObjectDelegationStatusEnum
    field :area, :decimal
    field :deforestation_submission_date, :date
    field :location, :string
    field :preliminary_volume, :decimal
    field :sticks, :boolean, default: false
    field :sticks_volume, :decimal
    field :supplier, :string

    timestamps()
  end

  @doc false
  def changeset(%Object{} = object, attrs) do
    object
    |> cast(attrs, [:type, :business_status, :delegation_status, 
                    :supplier, :location, 
                    :deforestation_submission_date, :area, 
                    :preliminary_volume, :sticks, :sticks_volume])
    |> validate_required([:type, :supplier, :location])
    |> validate_length(:supplier, min: 3)
    |> validate_length(:location, min: 3)
  end
end
