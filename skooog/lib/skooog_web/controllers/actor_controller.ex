defmodule SkooogWeb.ActorController do
  use SkooogWeb, :controller

  alias Skooog.Core
  alias Skooog.Core.Actor

  def index(conn, _params) do
    actors = Core.list_actors()
    render(conn, "index.html", actors: actors)
  end

  def new(conn, _params) do
    changeset = Core.change_actor(%Actor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"actor" => actor_params}) do
    case Core.create_actor(actor_params) do
      {:ok, actor} ->
        conn
        |> put_flash(:info, "Actor created successfully.")
        |> redirect(to: actor_path(conn, :show, actor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    actor = Core.get_actor!(id)
    render(conn, "show.html", actor: actor)
  end

  def edit(conn, %{"id" => id}) do
    actor = Core.get_actor!(id)
    changeset = Core.change_actor(actor)
    render(conn, "edit.html", actor: actor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "actor" => actor_params}) do
    actor = Core.get_actor!(id)

    case Core.update_actor(actor, actor_params) do
      {:ok, actor} ->
        conn
        |> put_flash(:info, "Actor updated successfully.")
        |> redirect(to: actor_path(conn, :show, actor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", actor: actor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    actor = Core.get_actor!(id)
    {:ok, _actor} = Core.delete_actor(actor)

    conn
    |> put_flash(:info, "Actor deleted successfully.")
    |> redirect(to: actor_path(conn, :index))
  end
end
