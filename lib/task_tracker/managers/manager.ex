defmodule TaskTracker.Managers.Manager do
  use Ecto.Schema
  import Ecto.Changeset


  schema "managers" do
    field :name, :string
    has_many :users, TaskTracker.Users.User

    timestamps()
  end

  @doc false
  def changeset(manager, attrs) do
    manager
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
