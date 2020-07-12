defmodule Bsb.Soup.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :content, :string
    field :read, :boolean, default: false
    field :score, :float
    field :summary, :string
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :content, :score, :summary, :url, :read])
    |> validate_required([:title, :content, :score, :summary, :url, :read])
  end
end
