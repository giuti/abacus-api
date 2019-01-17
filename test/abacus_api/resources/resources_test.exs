defmodule AbacusApi.ResourcesTest do
  use AbacusApi.DataCase

  alias AbacusApi.Resources

  describe "teams" do
    alias AbacusApi.Resources.Team

    @valid_attrs %{crest: "some crest", draw: 42, goalsAgainst: 42, goalsDiff: 42, goalsFor: 42, lost: 42, name: "some name", played: 42, points: 42, position: 42, teamId: 42, teamsDiff: %{}, won: 42}
    @update_attrs %{crest: "some updated crest", draw: 43, goalsAgainst: 43, goalsDiff: 43, goalsFor: 43, lost: 43, name: "some updated name", played: 43, points: 43, position: 43, teamId: 43, teamsDiff: %{}, won: 43}
    @invalid_attrs %{crest: nil, draw: nil, goalsAgainst: nil, goalsDiff: nil, goalsFor: nil, lost: nil, name: nil, played: nil, points: nil, position: nil, teamId: nil, teamsDiff: nil, won: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Resources.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Resources.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Resources.create_team(@valid_attrs)
      assert team.crest == "some crest"
      assert team.draw == 42
      assert team.goalsAgainst == 42
      assert team.goalsDiff == 42
      assert team.goalsFor == 42
      assert team.lost == 42
      assert team.name == "some name"
      assert team.played == 42
      assert team.points == 42
      assert team.position == 42
      assert team.teamId == 42
      assert team.teamsDiff == %{}
      assert team.won == 42
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Resources.update_team(team, @update_attrs)
      assert team.crest == "some updated crest"
      assert team.draw == 43
      assert team.goalsAgainst == 43
      assert team.goalsDiff == 43
      assert team.goalsFor == 43
      assert team.lost == 43
      assert team.name == "some updated name"
      assert team.played == 43
      assert team.points == 43
      assert team.position == 43
      assert team.teamId == 43
      assert team.teamsDiff == %{}
      assert team.won == 43
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_team(team, @invalid_attrs)
      assert team == Resources.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Resources.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Resources.change_team(team)
    end
  end
end
