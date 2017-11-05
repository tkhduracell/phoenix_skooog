defmodule SkooogWeb.SessionController do
  use SkooogWeb, :controller

  alias Skooog.Core
  alias Skooog.Core.Actor
  alias Skooog.Repo
  alias Skooog.Auth

  plug :scrub_params, "session" when action in ~w(create)a

  def new(conn, _) do  
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => username,
                                    "password" => password}}) do
    case Skooog.Auth.Login.login(username, password, Skooog.Repo) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, gettext("Logged in as %{name}", name: username))
        |> redirect(to: "/")
      {:error, :invalid_password} ->
        conn
        |> put_flash(:info, gettext("Invalid password"))
        |> render "new.html"
      {:error, :not_found} ->
        conn
        |> put_flash(:info, gettext("No such user"))
        |> render "new.html"
      _ -> 
        conn
        |> put_flash(:info, gettext("Unknown error occured..."))
        |> render "new.html"
    end
  end  

  def delete(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, gettext("Logged out"))
    |> redirect(to: "/")
  end

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> put_flash(:info, gettext("Authentication required"))
    |> redirect(to: "/")
  end

end