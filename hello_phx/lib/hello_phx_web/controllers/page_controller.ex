defmodule HelloPhxWeb.PageController do
  use HelloPhxWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout(:app)
    |> render(:index)
  end
end
