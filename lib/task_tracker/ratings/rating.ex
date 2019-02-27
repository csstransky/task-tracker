defmodule TaskTracker.Ratings.Rating do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ratings" do
    field :stars, :integer
    belongs_to :user, TaskTracker.Users.User
    belongs_to :product, TaskTracker.Products.Product

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:stars, :user_id, :product_id])
    |> validate_required([:stars, :user_id, :product_id])
    |> unique_constraint(:user_id, name: :ratings_user_id_product_id_index)
  end
end
