defmodule HelloPhxWeb.HelloController do
  use HelloPhxWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout(:bare)
    |> render(:index)
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, :show, messenger: messenger
  end

end