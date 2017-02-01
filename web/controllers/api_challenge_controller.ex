defmodule TouchRecorderWeb.ApiChallengeController do
  use TouchRecorderWeb.Web, :controller

  alias TouchRecorderWeb.Challenge

  def index(conn, _params) do
    challenges = Repo.all(Challenge)
    json conn, %{ version: "1.0", challenges: Enum.map(challenges, &challenge_json/1) }
  end

  def challenge_json(challenge) do
    %{
      id: challenge.id,
      name: challenge.name,
      details: challenge.details,
      description_set: challenge.description_set
    }
  end
end
