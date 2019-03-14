defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :admin, :boolean, default: false
    belongs_to :manager, TaskTracker.Users.User
    has_many :users, TaskTracker.Users.User, foreign_key: :manager_id
    has_many :tasks, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :admin, :manager_id])
    |> validate_required([:name, :admin])
  end
end
