defmodule TouchRecorderWeb.PageController do
  use TouchRecorderWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
