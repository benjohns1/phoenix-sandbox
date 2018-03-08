defmodule HelloPhxWeb.Router do
  use HelloPhxWeb, :router
  alias HelloPhxWeb.Router.Helpers

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

  scope "/", HelloPhxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
  end

  scope "/cms", HelloPhxWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/pages", PageController
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: Helpers.session_path(conn, :new))
        |> halt()
      user_id ->
        assign(conn, :current_user, HelloPhx.Accounts.get_user!(user_id))
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhxWeb do
  #   pipe_through :api
  # end
end
