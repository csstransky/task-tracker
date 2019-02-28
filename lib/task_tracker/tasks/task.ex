defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :desc, :string
    field :time, :decimal
    field :title, :string
    field :assigned_user, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :time])
    |> validate_required([:title, :desc, :time])
  end
end
