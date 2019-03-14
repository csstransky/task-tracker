defmodule TaskTracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :admin, :boolean, default: false, null: false
      add :manager_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:users, [:manager_id])
  end
end
