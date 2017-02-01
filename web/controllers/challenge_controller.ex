defmodule TouchRecorderWeb.ChallengeController do
  use TouchRecorderWeb.Web, :controller

  alias TouchRecorderWeb.Challenge

  def index(conn, _params) do
    challenges = Repo.all(Challenge)
    render(conn, "index.html", challenges: challenges)
  end

  def new(conn, _params) do
    changeset = Challenge.changeset(%Challenge{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"challenge" => challenge_params}) do
    changeset = Challenge.changeset(%Challenge{}, challenge_params)

    case Repo.insert(changeset) do
      {:ok, _challenge} ->
        conn
        |> put_flash(:info, "Challenge created successfully.")
        |> redirect(to: challenge_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    challenge = Repo.get!(Challenge, id)
    render(conn, "show.html", challenge: challenge)
  end

  def edit(conn, %{"id" => id}) do
    challenge = Repo.get!(Challenge, id)
    changeset = Challenge.changeset(challenge)
    render(conn, "edit.html", challenge: challenge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "challenge" => challenge_params}) do
    challenge = Repo.get!(Challenge, id)
    changeset = Challenge.changeset(challenge, challenge_params)

    case Repo.update(changeset) do
      {:ok, challenge} ->
        conn
        |> put_flash(:info, "Challenge updated successfully.")
        |> redirect(to: challenge_path(conn, :show, challenge))
      {:error, changeset} ->
        render(conn, "edit.html", challenge: challenge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    challenge = Repo.get!(Challenge, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(challenge)

    conn
    |> put_flash(:info, "Challenge deleted successfully.")
    |> redirect(to: challenge_path(conn, :index))
  end
end
