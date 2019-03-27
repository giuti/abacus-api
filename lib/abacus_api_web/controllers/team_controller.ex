defmodule AbacusApiWeb.TeamController do
  use AbacusApiWeb, :controller

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Team
  alias AbacusApi.Resources.Match
  alias AbacusApi.Repo

  action_fallback AbacusApiWeb.FallbackController

  def index(conn, _params) do
    teams = Resources.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def show(conn, %{"id" => id}) do
    team = Resources.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def updateTeams(conn, _params) do
    HTTPoison.start

    standingsJsonList = HTTPoison.get!("http://api.football-data.org/v2/competitions/2014/standings", [{"X-Auth-Token", System.get_env("DANIEL_API_KEY")}])
    resultStandingMap = ExJSON.parse(standingsJsonList.body, :to_map)
    standingsMapList = resultStandingMap["standings"]
    totalStandingMap = hd(standingsMapList)
    tableMapList = totalStandingMap["table"]
    for map <- tableMapList do
      mapTeam = map["team"]
      team = Repo.get_by(Team, teamId: mapTeam["id"])
      if team do
        Resources.update_team(team, %{"teamId" => mapTeam["id"], "position" => map["position"], "name" => mapTeam["name"], "played" => map["playedGames"], "won" => map["won"], "draw" => map["draw"], "lost" => map["lost"], "points" => map["points"], "goalsFor" => map["goalsFor"], "goalsAgainst" => map["goalsAgainst"], "goalsDiff" => map["goalDifference"]})
      else
        Resources.create_team(%{"teamId" => mapTeam["id"], "position" => map["position"], "name" => mapTeam["name"], "crest" => mapTeam["crestUrl"], "played" => map["playedGames"], "won" => map["won"], "draw" => map["draw"], "lost" => map["lost"], "points" => map["points"], "goalsFor" => map["goalsFor"], "goalsAgainst" => map["goalsAgainst"], "goalsDiff" => map["goalDifference"]})
      end
    end

    matchesJsonList = HTTPoison.get!("http://api.football-data.org/v2/competitions/2014/matches", [{"X-Auth-Token", System.get_env("DANIEL_API_KEY")}])
    resultMatchesMap = ExJSON.parse(matchesJsonList.body, :to_map)
    matchesMapList = resultMatchesMap["matches"]
    for map <- matchesMapList do
      mapHomeTeam = map["homeTeam"]
      homeTeam = Repo.get_by(Team, teamId: mapHomeTeam["id"])
      mapAwayTeam = map["awayTeam"]
      awayTeam = Repo.get_by(Team, teamId: mapAwayTeam["id"])
      score = map["score"]
      fullTime = score["fullTime"]
      if fullTime["homeTeam"] do
        calculatedDiff = fullTime["homeTeam"] - fullTime["awayTeam"]
        Resources.create_gap(%{"teamId" => homeTeam.id, "awayTeamId" => awayTeam.id, "diff" => calculatedDiff})
      end

      match = Repo.get_by(Match, matchId: map["id"])
      if match do
        Resources.update_match(match, %{"awayTeamGoals" => fullTime["awayTeam"], "homeTeamGoals" => fullTime["homeTeam"], "matchId" => map["id"], "matchday" => map["matchday"], "status" => map["status"], "utcDate" => map["utcDate"], "homeTeamId" => homeTeam.id, "awayTeamId" => awayTeam.id, "homeTeamName" => mapHomeTeam["name"], "awayTeamName" => mapAwayTeam["name"], "homeCrest" => homeTeam.crest, "awayCrest" => awayTeam.crest})
      else
        Resources.create_match(%{"awayTeamGoals" => fullTime["awayTeam"], "homeTeamGoals" => fullTime["homeTeam"], "matchId" => map["id"], "matchday" => map["matchday"], "status" => map["status"], "utcDate" => map["utcDate"], "homeTeamId" => homeTeam.id, "awayTeamId" => awayTeam.id, "homeTeamName" => mapHomeTeam["name"], "awayTeamName" =>mapAwayTeam["name"], "homeCrest" => homeTeam.crest, "awayCrest" => awayTeam.crest})
      end
    end

    teams = Resources.list_teams()
    render(conn, "index.json", teams: teams)
  end
end
