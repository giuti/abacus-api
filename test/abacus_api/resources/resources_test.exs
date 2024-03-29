defmodule AbacusApi.ResourcesTest do
  use AbacusApi.DataCase

  alias AbacusApi.Resources

  describe "teams" do
    alias AbacusApi.Resources.Team

    @valid_attrs %{crest: "some crest", draw: 42, goalsAgainst: 42, goalsDiff: 42, goalsFor: 42, lost: 42, name: "some name", played: 42, points: 42, position: 42, teamId: 42, won: 42}
    @update_attrs %{crest: "some updated crest", draw: 43, goalsAgainst: 43, goalsDiff: 43, goalsFor: 43, lost: 43, name: "some updated name", played: 43, points: 43, position: 43, teamId: 43, won: 43}
    @invalid_attrs %{crest: nil, draw: nil, goalsAgainst: nil, goalsDiff: nil, goalsFor: nil, lost: nil, name: nil, played: nil, points: nil, position: nil, teamId: nil, won: nil}

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

  describe "gaps" do
    alias AbacusApi.Resources.Gap

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def gap_fixture(attrs \\ %{}) do
      {:ok, gap} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_gap()

      gap
    end

    test "list_gaps/0 returns all gaps" do
      gap = gap_fixture()
      assert Resources.list_gaps() == [gap]
    end

    test "get_gap!/1 returns the gap with given id" do
      gap = gap_fixture()
      assert Resources.get_gap!(gap.id) == gap
    end

    # test "create_gap/1 with valid data creates a gap" do
    #   assert {:ok, %Gap{} = gap} = Resources.create_gap(@valid_attrs)
    # end

    # test "create_gap/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Resources.create_gap(@invalid_attrs)
    # end

    # test "update_gap/2 with valid data updates the gap" do
    #   gap = gap_fixture()
    #   assert {:ok, %Gap{} = gap} = Resources.update_gap(gap, @update_attrs)
    # end

    # test "update_gap/2 with invalid data returns error changeset" do
    #   gap = gap_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Resources.update_gap(gap, @invalid_attrs)
    #   assert gap == Resources.get_gap!(gap.id)
    # end

    test "delete_gap/1 deletes the gap" do
      gap = gap_fixture()
      assert {:ok, %Gap{}} = Resources.delete_gap(gap)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_gap!(gap.id) end
    end

    test "change_gap/1 returns a gap changeset" do
      gap = gap_fixture()
      assert %Ecto.Changeset{} = Resources.change_gap(gap)
    end
  end

  describe "matches" do
    alias AbacusApi.Resources.Match

    @valid_attrs %{awayTeamGoals: 42, homeTeamGoals: 42, matchId: 42, matchday: 42, status: "some status", utcDate: "some utcDate"}
    @update_attrs %{awayTeamGoals: 43, homeTeamGoals: 43, matchId: 43, matchday: 43, status: "some updated status", utcDate: "some updated utcDate"}
    @invalid_attrs %{awayTeamGoals: nil, homeTeamGoals: nil, matchId: nil, matchday: nil, status: nil, utcDate: nil}

    def match_fixture(attrs \\ %{}) do
      {:ok, match} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Resources.create_match()

      match
    end

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Resources.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Resources.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      assert {:ok, %Match{} = match} = Resources.create_match(@valid_attrs)
      assert match.awayTeamGoals == 42
      assert match.homeTeamGoals == 42
      assert match.matchId == 42
      assert match.matchday == 42
      assert match.status == "some status"
      assert match.utcDate == "some utcDate"
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      assert {:ok, %Match{} = match} = Resources.update_match(match, @update_attrs)
      assert match.awayTeamGoals == 43
      assert match.homeTeamGoals == 43
      assert match.matchId == 43
      assert match.matchday == 43
      assert match.status == "some updated status"
      assert match.utcDate == "some updated utcDate"
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_match(match, @invalid_attrs)
      assert match == Resources.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Resources.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Resources.change_match(match)
    end
  end
end
