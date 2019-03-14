defmodule TaskTracker.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :name, :string

      timestamps()
    end

  end
end
