defmodule SkooogWeb.Router do
  use SkooogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SkooogWeb.Locale
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: Skooog.SessionController
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SkooogWeb do
    pipe_through :browser 

    get "/", PageController, :index

    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
  end

  scope "/", SkooogWeb do 
    pipe_through [:browser, :browser_auth]

    resources "/objects", ObjectController
    resources "/actors", ActorController
    resources "/users", UserController
  end

end
