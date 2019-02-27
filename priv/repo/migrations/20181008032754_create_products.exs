defmodule TaskTracker.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :desc, :text
      add :price, :decimal
      add :inventory, :integer

      timestamps()
    end

  end
end
