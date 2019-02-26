defmodule AbacusApi.Repo.Migrations.UpdateMatches do
  use Ecto.Migration

  def change do
    alter table(:matches) do
      add :homeCrest, :string
      add :awayCrest, :string
    end
  end
end
