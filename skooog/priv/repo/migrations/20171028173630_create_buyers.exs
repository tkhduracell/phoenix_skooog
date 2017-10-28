defmodule Skooog.Repo.Migrations.CreateBuyers do
  use Ecto.Migration

  def change do
    create table(:buyers) do
      add :name, :string

      timestamps()
    end

  end
end
