defmodule TouchRecorderWeb.ChallengeTest do
  use TouchRecorderWeb.ModelCase

  alias TouchRecorderWeb.Challenge

  @valid_attrs %{description_set: [], details: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
