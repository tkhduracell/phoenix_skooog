defmodule Skooog.Repo.Migrations.CreateObjects do
  use Ecto.Migration

  def change do
    ObjectBusinessStatusEnum.create_type
    ObjectTypeEnum.create_type
    
    create table(:objects) do
      add :type, :object_type
      add :business_status, :object_business_status
      
      add :buyer_id, references(:buyers, on_delete: :nothing)
      
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

    create index(:objects, [:buyer_id])
  end

  def down do
    ObjectBusinessStatusEnum.drop_type
    ObjectTypeEnum.drop_type
  end

end
