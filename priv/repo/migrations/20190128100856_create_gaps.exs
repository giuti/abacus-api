defmodule AbacusApi.Repo.Migrations.CreateGaps do
  use Ecto.Migration

  def change do
    create table(:gaps) do
      add :teamId, references(:teams, on_delete: :nothing)
      add :awayTeamId, references(:teams, on_delete: :nothing)
      add :diff, :integer

      timestamps()
    end

    create index(:gaps, [:teamId])
    create index(:gaps, [:awayTeamId])
  end
end
