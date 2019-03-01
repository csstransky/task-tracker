defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :admin, :boolean, default: false
    has_many :tasks, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :admin])
    |> validate_required([:name, :admin])
  end
end
