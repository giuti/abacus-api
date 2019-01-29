defmodule AbacusApiWeb.GapController do
  use AbacusApiWeb, :controller

  alias AbacusApi.Resources

  action_fallback AbacusApiWeb.FallbackController

  def index(conn, _params) do
    gaps = Resources.list_gaps()
    render(conn, "index.json", gaps: gaps)
  end

  def show(conn, %{"id" => id}) do
    gap = Resources.get_gap!(id)
    render(conn, "show.json", gap: gap)
  end

end
