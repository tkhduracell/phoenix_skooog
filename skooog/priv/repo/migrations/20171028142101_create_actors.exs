defmodule Skooog.Repo.Migrations.CreateActors do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :title, :string

      timestamps()
    end

  end
end
