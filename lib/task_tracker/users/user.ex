defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    belongs_to :manager, TaskTracker.Users.User
    has_many :users, TaskTracker.Users.User, foreign_key: :manager_id #TODO Look at some documentation
    has_many :tasks, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :manager_id])
    |> validate_required([:name])
  end
end
