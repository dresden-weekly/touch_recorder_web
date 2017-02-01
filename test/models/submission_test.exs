defmodule TouchRecorderWeb.SubmissionTest do
  use TouchRecorderWeb.ModelCase

  alias TouchRecorderWeb.Submission

  @valid_attrs %{archive: %{}, author: "some content", challenge_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Submission.changeset(%Submission{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Submission.changeset(%Submission{}, @invalid_attrs)
    refute changeset.valid?
  end
end
