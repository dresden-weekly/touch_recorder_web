defmodule TouchRecorderWeb.Router do
  use TouchRecorderWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TouchRecorderWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/challenges", ChallengeController
    resources "/submissions", SubmissionController, only: [:index, :show, :delete]
  end

  # Other scopes may use custom stacks.
  scope "/api", TouchRecorderWeb do
    pipe_through :api
    resources "/challenges", ApiChallengeController, only: [:index]
    resources "/submissions", ApiSubmissionController, only: [:create]
  end
end
