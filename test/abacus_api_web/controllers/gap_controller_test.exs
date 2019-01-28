defmodule AbacusApiWeb.GapControllerTest do
  use AbacusApiWeb.ConnCase

  alias AbacusApi.Resources
  alias AbacusApi.Resources.Gap

  @create_attrs %{
    awayTeamId: 42,
    diff: 42,
    teamId: 42
  }
  @update_attrs %{
    awayTeamId: 43,
    diff: 43,
    teamId: 43
  }
  @invalid_attrs %{awayTeamId: nil, diff: nil, teamId: nil}

  def fixture(:gap) do
    {:ok, gap} = Resources.create_gap(@create_attrs)
    gap
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all gaps", %{conn: conn} do
      conn = get(conn, Routes.gap_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gap" do
    test "renders gap when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gap_path(conn, :create), gap: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.gap_path(conn, :show, id))

      assert %{
               "id" => id,
               "awayTeamId" => 42,
               "diff" => 42,
               "teamId" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gap_path(conn, :create), gap: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gap" do
    setup [:create_gap]

    test "renders gap when data is valid", %{conn: conn, gap: %Gap{id: id} = gap} do
      conn = put(conn, Routes.gap_path(conn, :update, gap), gap: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.gap_path(conn, :show, id))

      assert %{
               "id" => id,
               "awayTeamId" => 43,
               "diff" => 43,
               "teamId" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, gap: gap} do
      conn = put(conn, Routes.gap_path(conn, :update, gap), gap: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gap" do
    setup [:create_gap]

    test "deletes chosen gap", %{conn: conn, gap: gap} do
      conn = delete(conn, Routes.gap_path(conn, :delete, gap))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.gap_path(conn, :show, gap))
      end
    end
  end

  defp create_gap(_) do
    gap = fixture(:gap)
    {:ok, gap: gap}
  end
end
