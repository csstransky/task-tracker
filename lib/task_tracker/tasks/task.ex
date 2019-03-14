defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  alias Decimal


  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string
    field :title, :string
    belongs_to :user, TaskTracker.Users.User
    has_many :time_blocks,  TaskTracker.TimeBlocks.TimeBlock

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :complete, :user_id])
    |> validate_required([:title, :complete])
    |> validate_positive_time(:time)
  end

  def validate_positive_time(changeset, field) do
    validate_change(changeset, field, fn _, time ->
      if Decimal.cmp(time, 0) == :lt do
          [{field, "must be positive"}]
        else
          []
        end
    end)
  end
end
