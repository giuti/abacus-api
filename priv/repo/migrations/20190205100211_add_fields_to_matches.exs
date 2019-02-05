defmodule AbacusApi.Repo.Migrations.AddFieldsToMatches do
  use Ecto.Migration

  def change do
    alter table(:matches) do
      add :homeTeamName, :string
      add :awayTeamName, :string
    end
  end
end
