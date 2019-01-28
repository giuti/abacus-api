defmodule AbacusApi.Resources.Gap do
  use Ecto.Schema
  import Ecto.Changeset


  schema "gaps" do
    field :teamId, :id
    field :awayTeamId, :id
    field :diff, :integer

    timestamps()
  end

  @doc false
  def changeset(gap, attrs) do
    gap
    |> cast(attrs, [:teamId, :awayTeamId, :diff])
    |> validate_required([])
  end
end
