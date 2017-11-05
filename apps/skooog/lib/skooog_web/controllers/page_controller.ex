defmodule SkooogWeb.PageController do
  use SkooogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
