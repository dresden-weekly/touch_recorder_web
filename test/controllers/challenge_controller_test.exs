defmodule TouchRecorderWeb.ChallengeControllerTest do
  use TouchRecorderWeb.ConnCase

  alias TouchRecorderWeb.Challenge
  @valid_attrs %{description_set: [], details: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, challenge_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing challenges"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, challenge_path(conn, :new)
    assert html_response(conn, 200) =~ "New challenge"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, challenge_path(conn, :create), challenge: @valid_attrs
    assert redirected_to(conn) == challenge_path(conn, :index)
    assert Repo.get_by(Challenge, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, challenge_path(conn, :create), challenge: @invalid_attrs
    assert html_response(conn, 200) =~ "New challenge"
  end

  test "shows chosen resource", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = get conn, challenge_path(conn, :show, challenge)
    assert html_response(conn, 200) =~ "Show challenge"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, challenge_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = get conn, challenge_path(conn, :edit, challenge)
    assert html_response(conn, 200) =~ "Edit challenge"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = put conn, challenge_path(conn, :update, challenge), challenge: @valid_attrs
    assert redirected_to(conn) == challenge_path(conn, :show, challenge)
    assert Repo.get_by(Challenge, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = put conn, challenge_path(conn, :update, challenge), challenge: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit challenge"
  end

  test "deletes chosen resource", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = delete conn, challenge_path(conn, :delete, challenge)
    assert redirected_to(conn) == challenge_path(conn, :index)
    refute Repo.get(Challenge, challenge.id)
  end
end
