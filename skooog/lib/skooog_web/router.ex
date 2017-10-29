defmodule SkooogWeb.Router do
  use SkooogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SkooogWeb.Locale
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SkooogWeb do
    pipe_through :browser 

    get "/", PageController, :index

    resources "/objects", ObjectController
    resources "/actors", ActorController
  end

end
