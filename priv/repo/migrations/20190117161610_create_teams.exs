defmodule AbacusApi.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :teamId, :integer
      add :position, :integer
      add :name, :string
      add :crest, :string
      add :played, :integer
      add :won, :integer
      add :draw, :integer
      add :lost, :integer
      add :points, :integer
      add :goalsFor, :integer
      add :goalsAgainst, :integer
      add :goalsDiff, :integer

      timestamps()
    end

  end
end
