defmodule AbacusApiWeb.MatchView do
  use AbacusApiWeb, :view
  alias AbacusApiWeb.MatchView

  def render("index.json", %{matches: matches}) do
    %{data: render_many(matches, MatchView, "match.json")}
  end

  def render("show.json", %{match: match}) do
    %{data: render_one(match, MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    %{id: match.id,
      matchId: match.matchId,
      utcDate: match.utcDate,
      status: match.status,
      matchday: match.matchday,
      homeTeamGoals: match.homeTeamGoals,
      awayTeamGoals: match.awayTeamGoals,
      homeTeamId: match.homeTeamId,
      awayTeamId: match.awayTeamId,
      homeTeamName: match.homeTeamName,
      awayTeamName: match.awayTeamName,
      homeCrest: match.homeCrest,
      awayCrest: match.awayCrest}
  end
end
