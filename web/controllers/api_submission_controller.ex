defmodule TouchRecorderWeb.ApiSubmissionController do
  use TouchRecorderWeb.Web, :controller

  alias TouchRecorderWeb.Submission

  def create(conn, %{"submission" => submission_params}) do
    changeset = Submission.changeset(%Submission{}, submission_params)

    case Repo.insert(changeset) do
      {:ok, _submission} ->
        conn
        |> send_resp(200, "")
      {:error, changeset} ->
        conn
        |> send_resp(501, changeset.errors)
    end
  end
end
