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

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:matchId, :utcDate, :status, :matchday, :homeTeamGoals, :awayTeamGoals])
    |> validate_required([:matchId, :utcDate, :status, :matchday, :homeTeamGoals, :awayTeamGoals])
  end
end
