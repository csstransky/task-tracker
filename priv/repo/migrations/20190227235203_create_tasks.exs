defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :desc, :text
      add :time, :decimal
      add :time_blocks, {:array, {:array, :naive_datetime}}
      # TODO: Change the way the on_delete works
      add :user_id, references(:users, on_delete: :nothing)
      add :complete, :boolean, default: false, null: false

      timestamps()
    end

    create index(:tasks, [:user_id])
  end
end
