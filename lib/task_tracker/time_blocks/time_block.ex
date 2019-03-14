defmodule TaskTracker.TimeBlocks.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset


  schema "time_blocks" do
    field :time_end, :naive_datetime
    field :time_start, :naive_datetime
    field :total_time, :decimal
    belongs_to :task, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(time_block, attrs) do
    time_block
    |> cast(attrs, [:time_start, :time_end, :total_time, :task_id])
    |> validate_required([:time_start, :time_end, :task_id])
    |> validate_chronological([:time_start, :time_end])
  end

  def validate_chronological(changeset, field) do
    validate_change(changeset, field, fn _, [time_start, time_end] ->
      if NaiveDateTime.compare(time_start, time_end) == :gt do
          [{field, "time block must be chronological"}]
        else
          []
        end
    end)
  end
end
