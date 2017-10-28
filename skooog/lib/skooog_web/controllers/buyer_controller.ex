defmodule SkooogWeb.BuyerController do
  use SkooogWeb, :controller

  alias Skooog.Core
  alias Skooog.Core.Buyer

  def index(conn, _params) do
    buyers = Core.list_buyers()
    render(conn, "index.html", buyers: buyers)
  end

  def new(conn, _params) do
    changeset = Core.change_buyer(%Buyer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"buyer" => buyer_params}) do
    case Core.create_buyer(buyer_params) do
      {:ok, buyer} ->
        conn
        |> put_flash(:info, "Buyer created successfully.")
        |> redirect(to: buyer_path(conn, :show, buyer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    buyer = Core.get_buyer!(id)
    render(conn, "show.html", buyer: buyer)
  end

  def edit(conn, %{"id" => id}) do
    buyer = Core.get_buyer!(id)
    changeset = Core.change_buyer(buyer)
    render(conn, "edit.html", buyer: buyer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "buyer" => buyer_params}) do
    buyer = Core.get_buyer!(id)

    case Core.update_buyer(buyer, buyer_params) do
      {:ok, buyer} ->
        conn
        |> put_flash(:info, "Buyer updated successfully.")
        |> redirect(to: buyer_path(conn, :show, buyer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", buyer: buyer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    buyer = Core.get_buyer!(id)
    {:ok, _buyer} = Core.delete_buyer(buyer)

    conn
    |> put_flash(:info, "Buyer deleted successfully.")
    |> redirect(to: buyer_path(conn, :index))
  end
end
