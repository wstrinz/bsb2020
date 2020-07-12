defmodule BSBWeb.PageController do
  use BSBWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
