defmodule SkooogWeb.ObjectController do
  use SkooogWeb, :controller

  alias Skooog.Core
  alias Skooog.Core.Object

  def index(conn, _params) do
    objects = Core.list_objects()
    render(conn, "index.html", objects: objects)
  end

  def new(conn, _params) do
    changeset = Core.change_object(%Object{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"object" => object_params}) do
    case Core.create_object(object_params) do
      {:ok, object} ->
        conn
        |> put_flash(:info, "Object created successfully.")
        |> redirect(to: object_path(conn, :show, object))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    object = Core.get_object!(id)
    render(conn, "show.html", object: object)
  end

  def edit(conn, %{"id" => id}) do
    object = Core.get_object!(id)
    changeset = Core.change_object(object)
    render(conn, "edit.html", object: object, changeset: changeset)
  end

  def update(conn, %{"id" => id, "object" => object_params}) do
    object = Core.get_object!(id)

    case Core.update_object(object, object_params) do
      {:ok, object} ->
        conn
        |> put_flash(:info, "Object updated successfully.")
        |> redirect(to: object_path(conn, :show, object))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", object: object, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    object = Core.get_object!(id)
    {:ok, _object} = Core.delete_object(object)

    conn
    |> put_flash(:info, "Object deleted successfully.")
    |> redirect(to: object_path(conn, :index))
  end
end
