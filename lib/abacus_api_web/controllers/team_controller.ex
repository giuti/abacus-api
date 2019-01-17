defmodule AbacusApiWeb.TeamController do
  use AbacusApiWeb, :controller

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Team

  action_fallback AbacusApiWeb.FallbackController

  def index(conn, _params) do
    teams = Resources.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- Resources.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = Resources.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Resources.get_team!(id)

    with {:ok, %Team{} = team} <- Resources.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Resources.get_team!(id)

    with {:ok, %Team{}} <- Resources.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end
