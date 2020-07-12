defmodule Bsb.Repo.Migrations.CreateStories do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :title, :string
      add :content, :string
      add :score, :float
      add :summary, :string
      add :url, :string
      add :read, :boolean, default: false, null: false

      timestamps()
    end

  end
end
