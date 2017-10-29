defmodule Skooog.Repo.Migrations.CreateObjects do
  use Ecto.Migration

  def change do
    ObjectTypeEnum.create_type
    ObjectBusinessStatusEnum.create_type
    ObjectDelegationStatusEnum.create_type
    
    create table(:objects) do
      add :type, :object_type
      add :business_status, :object_business_status
      add :delegation_status, :object_delegation_status
      
      add :supplier, :string
      add :location, :string
      add :deforestation_submission_date, :date
      add :deforestation_confirmed_date, :date
      add :area, :decimal
      add :preliminary_volume, :decimal
      add :sticks, :boolean, default: false, null: false
      add :sticks_volume, :decimal

      timestamps()
    end
  end

  def down do
    ObjectTypeEnum.drop_type
    ObjectBusinessStatusEnum.drop_type
    ObjectDelegationStatusEnum.drop_type
  end

end
