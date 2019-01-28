defmodule AbacusApiWeb.GapView do
  use AbacusApiWeb, :view
  alias AbacusApiWeb.GapView

  def render("index.json", %{gaps: gaps}) do
    %{data: render_many(gaps, GapView, "gap.json")}
  end

  def render("show.json", %{gap: gap}) do
    %{data: render_one(gap, GapView, "gap.json")}
  end

  def render("gap.json", %{gap: gap}) do
    %{id: gap.id,
      teamId: gap.teamId,
      awayTeamId: gap.awayTeamId,
      diff: gap.diff}
  end
end
