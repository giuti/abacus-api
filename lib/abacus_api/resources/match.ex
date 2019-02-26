defmodule AbacusApi.Resources.Match do
  use Ecto.Schema
  import Ecto.Changeset


  schema "matches" do
    field :awayTeamGoals, :integer
    field :homeTeamGoals, :integer
    field :matchId, :integer
    field :matchday, :integer
    field :status, :string
    field :utcDate, :string
    field :homeTeamId, :id
    field :awayTeamId, :id
    field :homeTeamName, :string
    field :awayTeamName, :string
    field :homeCrest, :string
    field :awayCrest, :string

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:matchId, :utcDate, :status, :matchday, :homeTeamGoals, :awayTeamGoals, :homeTeamId, :awayTeamId, :homeTeamName, :awayTeamName, :homeCrest, :awayCrest])
    |> validate_required([:matchId])
  end
end
