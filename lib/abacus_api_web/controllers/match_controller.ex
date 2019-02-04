defmodule AbacusApiWeb.MatchController do
  use AbacusApiWeb, :controller

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Match

  action_fallback AbacusApiWeb.FallbackController

  def index(conn, _params) do
    matches = Resources.list_matches()
    render(conn, "index.json", matches: matches)
  end

  def create(conn, %{"match" => match_params}) do
    with {:ok, %Match{} = match} <- Resources.create_match(match_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.match_path(conn, :show, match))
      |> render("show.json", match: match)
    end
  end

  def show(conn, %{"id" => id}) do
    match = Resources.get_match!(id)
    render(conn, "show.json", match: match)
  end

  def update(conn, %{"id" => id, "match" => match_params}) do
    match = Resources.get_match!(id)

    with {:ok, %Match{} = match} <- Resources.update_match(match, match_params) do
      render(conn, "show.json", match: match)
    end
  end

  def delete(conn, %{"id" => id}) do
    match = Resources.get_match!(id)

    with {:ok, %Match{}} <- Resources.delete_match(match) do
      send_resp(conn, :no_content, "")
    end
  end
end
