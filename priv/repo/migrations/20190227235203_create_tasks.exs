defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :desc, :text
      add :time, :decimal, default: 1.0
      add :assigned_user, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:assigned_user])
  end
end
