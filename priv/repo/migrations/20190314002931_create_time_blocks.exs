defmodule TaskTracker.Repo.Migrations.CreateTimeBlocks do
  use Ecto.Migration

  def change do
    create table(:time_blocks) do
      add :time_start, :naive_datetime, null: false
      add :time_end, :naive_datetime, null: false
      add :task_id, references(:tasks, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:time_blocks, [:task_id])
  end
end
