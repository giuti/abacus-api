defmodule AbacusApiWeb.TeamControllerTest do
  use AbacusApiWeb.ConnCase

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Team

  @create_attrs %{
    crest: "some crest",
    draw: 42,
    goalsAgainst: 42,
    goalsDiff: 42,
    goalsFor: 42,
    lost: 42,
    name: "some name",
    played: 42,
    points: 42,
    position: 42,
    teamId: 42,
    won: 42
  }
  @update_attrs %{
    crest: "some updated crest",
    draw: 43,
    goalsAgainst: 43,
    goalsDiff: 43,
    goalsFor: 43,
    lost: 43,
    name: "some updated name",
    played: 43,
    points: 43,
    position: 43,
    teamId: 43,
    won: 43
  }
  @invalid_attrs %{crest: nil, draw: nil, goalsAgainst: nil, goalsDiff: nil, goalsFor: nil, lost: nil, name: nil, played: nil, points: nil, position: nil, teamId: nil, won: nil}

  def fixture(:team) do
    {:ok, team} = Resources.create_team(@create_attrs)
    team
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  defp create_team(_) do
    team = fixture(:team)
    {:ok, team: team}
  end
end
