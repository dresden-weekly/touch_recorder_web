defmodule TouchRecorderWeb.SubmissionController do
  use TouchRecorderWeb.Web, :controller

  alias TouchRecorderWeb.Submission

  def index(conn, _params) do
    submissions = Repo.all(Submission)
    render(conn, "index.html", submissions: submissions)
  end

  def show(conn, %{"id" => id}) do
    submission = Repo.get!(Submission, id)
    render(conn, "show.html", submission: submission)
  end

  def delete(conn, %{"id" => id}) do
    submission = Repo.get!(Submission, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(submission)

    conn
    |> put_flash(:info, "Submission deleted successfully.")
    |> redirect(to: submission_path(conn, :index))
  end
end
