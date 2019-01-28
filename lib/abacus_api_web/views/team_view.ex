defmodule AbacusApiWeb.TeamView do
  use AbacusApiWeb, :view
  alias AbacusApiWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{id: team.id,
      teamId: team.teamId,
      position: team.position,
      name: team.name,
      crest: team.crest,
      played: team.played,
      won: team.won,
      draw: team.draw,
      lost: team.lost,
      points: team.points,
      goalsFor: team.goalsFor,
      goalsAgainst: team.goalsAgainst,
      goalsDiff: team.goalsDiff}
  end
end
