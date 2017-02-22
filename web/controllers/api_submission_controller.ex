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

  def index(conn, %{
    "challenge" => ch_id,
    "day" => ch_day,
    "month" => ch_month,
    "year" => ch_year
    }) do

    query = from s in Submission,
      where: [challenge_id: ^ch_id],
      where: s.inserted_at >= type(^Ecto.Date.from_erl(
      {
        String.to_integer(ch_year),
        String.to_integer(ch_month),
        String.to_integer(ch_day)
      }),Ecto.Date),
      order_by: [desc: s.inserted_at],
      select: s.archive

    submission = Repo.all(query)
    json conn, %{ submission: submission }
  end

end
