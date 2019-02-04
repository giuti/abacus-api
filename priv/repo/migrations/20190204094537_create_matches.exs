defmodule AbacusApi.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add :matchId, :integer
      add :utcDate, :string
      add :status, :string
      add :matchday, :integer
      add :homeTeamGoals, :integer
      add :awayTeamGoals, :integer
      add :homeTeamId, references(:teams, on_delete: :nothing)
      add :awayTeamId, references(:teams, on_delete: :nothing)

      timestamps()
    end

    create index(:matches, [:homeTeamId])
    create index(:matches, [:awayTeamId])
  end
end
