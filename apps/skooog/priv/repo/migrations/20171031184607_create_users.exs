defmodule Skooog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    UserTypeEnum.create_type

    create table(:users) do
      add :username, :string
      add :type, :user_type 
      add :crypted_password, :string
      add :salt, :string

      timestamps()
    end

    create unique_index(:users, [:username])
  end

  def down do
    drop index(:users, [:username])
    drop table(:users)
    UserTypeEnum.drop_type
  end
end
