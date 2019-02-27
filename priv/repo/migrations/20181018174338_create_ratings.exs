defmodule TaskTracker.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :stars, :integer, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :product_id, references(:products, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:ratings, [:user_id])
    create index(:ratings, [:product_id])
    create index(:ratings, [:user_id, :product_id], unique: true)
  end
end
