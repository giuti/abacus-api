defmodule AbacusApiWeb.TeamController do
  use AbacusApiWeb, :controller

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Team
  alias AbacusApi.Resources.Gap
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

    standingsJsonList = HTTPoison.get!("http://api.football-data.org/v2/competitions/2014/standings", [{"X-Auth-Token", "2b235ab73c8a4a8b9cbc541da8ab5191"}])
    resultStandingMap = ExJSON.parse(standingsJsonList.body, :to_map)
    standingsMapList = resultStandingMap["standings"]
    totalStandingMap = hd(standingsMapList)
    tableMapList = totalStandingMap["table"]
    for map <- tableMapList do
      mapTeam = map["team"]
      team = Repo.get_by(Team, teamId: mapTeam["id"])
      if team do
        IO.puts "_UPDATE_"
        IO.inspect mapTeam["name"]
        Resources.update_team(team, %{"teamId" => mapTeam["id"], "position" => map["position"], "name" => mapTeam["name"], "crest" => mapTeam["crestUrl"], "played" => map["playedGames"], "won" => map["won"], "draw" => map["draw"], "lost" => map["lost"], "points" => map["points"], "goalsFor" => map["goalsFor"], "goalsAgainst" => map["goalsAgainst"], "goalsDiff" => map["goalDifference"]})
        #team
         # |> Team.changeset(%{"teamId" => mapTeam["id"], "position" => map["position"], "name" => mapTeam["name"], "crest" => mapTeam["crestUrl"], "played" => map["playedGames"], "won" => map["won"], "draw" => map["draw"], "lost" => map["lost"], "points" => map["points"], "goalsFor" => map["goalsFor"], "goalsAgainst" => map["goalsAgainst"], "goalsDiff" => map["goalDifference"]})
         # |> Repo.update()
      else
        IO.puts "_CREATE_"
        IO.inspect mapTeam["name"]
        Resources.create_team(%{"teamId" => mapTeam["id"], "position" => map["position"], "name" => mapTeam["name"], "crest" => mapTeam["crestUrl"], "played" => map["playedGames"], "won" => map["won"], "draw" => map["draw"], "lost" => map["lost"], "points" => map["points"], "goalsFor" => map["goalsFor"], "goalsAgainst" => map["goalsAgainst"], "goalsDiff" => map["goalDifference"]})
        #%Team{}
         # |> Team.changeset(%{"teamId" => mapTeam["id"], "position" => map["position"], "name" => mapTeam["name"], "crest" => mapTeam["crestUrl"], "played" => map["playedGames"], "won" => map["won"], "draw" => map["draw"], "lost" => map["lost"], "points" => map["points"], "goalsFor" => map["goalsFor"], "goalsAgainst" => map["goalsAgainst"], "goalsDiff" => map["goalDifference"]})
         # |> Repo.insert()
      end
    end

    matchesJsonList = HTTPoison.get!("http://api.football-data.org/v2/competitions/2014/matches", [{"X-Auth-Token", "2b235ab73c8a4a8b9cbc541da8ab5191"}])
    resultMatchesMap = ExJSON.parse(matchesJsonList.body, :to_map)
    matchesMapList = resultMatchesMap["matches"]
    for map <- matchesMapList do
      mapHomeTeam = map["homeTeam"]
      team = Repo.get_by(Team, teamId: mapHomeTeam["id"])
      mapAwayTeam = map["awayTeam"]
      awayTeam = Repo.get_by(Team, teamId: mapAwayTeam["id"])
      score = map["score"]
      fullTime = score["fullTime"]
      if fullTime["homeTeam"] do
        calculatedDiff = fullTime["homeTeam"] - fullTime["awayTeam"]
        Resources.create_gap(%{"teamId" => team.id, "awayTeamId" => awayTeam.id, "diff" => calculatedDiff})
      end
    end

    teams = Resources.list_teams()
    render(conn, "index.json", teams: teams)
  end
end
