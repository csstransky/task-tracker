defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    has_many :tasks, TaskTracker.Tasks.Task
    belongs_to :manager, TaskTracker.Managers.Manager

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :manager_id])
    |> validate_required([:name])
  end
end
