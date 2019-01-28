defmodule AbacusApi.Resources.Team do
  use Ecto.Schema
  import Ecto.Changeset


  schema "teams" do
    field :crest, :string
    field :draw, :integer
    field :goalsAgainst, :integer
    field :goalsDiff, :integer
    field :goalsFor, :integer
    field :lost, :integer
    field :name, :string
    field :played, :integer
    field :points, :integer
    field :position, :integer
    field :teamId, :integer
    field :won, :integer

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:teamId, :position, :name, :crest, :played, :won, :draw, :lost, :points, :goalsFor, :goalsAgainst, :goalsDiff])
    |> validate_required([:teamId])
  end
end
