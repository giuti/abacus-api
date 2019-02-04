defmodule AbacusApiWeb.MatchControllerTest do
  use AbacusApiWeb.ConnCase

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Match

  @create_attrs %{
    awayTeamGoals: 42,
    homeTeamGoals: 42,
    matchId: 42,
    matchday: 42,
    status: "some status",
    utcDate: "some utcDate"
  }
  @update_attrs %{
    awayTeamGoals: 43,
    homeTeamGoals: 43,
    matchId: 43,
    matchday: 43,
    status: "some updated status",
    utcDate: "some updated utcDate"
  }
  @invalid_attrs %{awayTeamGoals: nil, homeTeamGoals: nil, matchId: nil, matchday: nil, status: nil, utcDate: nil}

  def fixture(:match) do
    {:ok, match} = Resources.create_match(@create_attrs)
    match
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all matches", %{conn: conn} do
      conn = get(conn, Routes.match_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create match" do
    test "renders match when data is valid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.match_path(conn, :show, id))

      assert %{
               "id" => id,
               "awayTeamGoals" => 42,
               "homeTeamGoals" => 42,
               "matchId" => 42,
               "matchday" => 42,
               "status" => "some status",
               "utcDate" => "some utcDate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update match" do
    setup [:create_match]

    test "renders match when data is valid", %{conn: conn, match: %Match{id: id} = match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.match_path(conn, :show, id))

      assert %{
               "id" => id,
               "awayTeamGoals" => 43,
               "homeTeamGoals" => 43,
               "matchId" => 43,
               "matchday" => 43,
               "status" => "some updated status",
               "utcDate" => "some updated utcDate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, match: match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete match" do
    setup [:create_match]

    test "deletes chosen match", %{conn: conn, match: match} do
      conn = delete(conn, Routes.match_path(conn, :delete, match))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.match_path(conn, :show, match))
      end
    end
  end

  defp create_match(_) do
    match = fixture(:match)
    {:ok, match: match}
  end
end
