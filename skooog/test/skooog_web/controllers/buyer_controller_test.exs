defmodule SkooogWeb.BuyerControllerTest do
  use SkooogWeb.ConnCase

  alias Skooog.Core

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:buyer) do
    {:ok, buyer} = Core.create_buyer(@create_attrs)
    buyer
  end

  describe "index" do
    test "lists all buyers", %{conn: conn} do
      conn = get conn, buyer_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Buyers"
    end
  end

  describe "new buyer" do
    test "renders form", %{conn: conn} do
      conn = get conn, buyer_path(conn, :new)
      assert html_response(conn, 200) =~ "New Buyer"
    end
  end

  describe "create buyer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, buyer_path(conn, :create), buyer: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == buyer_path(conn, :show, id)

      conn = get conn, buyer_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Buyer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, buyer_path(conn, :create), buyer: @invalid_attrs
      assert html_response(conn, 200) =~ "New Buyer"
    end
  end

  describe "edit buyer" do
    setup [:create_buyer]

    test "renders form for editing chosen buyer", %{conn: conn, buyer: buyer} do
      conn = get conn, buyer_path(conn, :edit, buyer)
      assert html_response(conn, 200) =~ "Edit Buyer"
    end
  end

  describe "update buyer" do
    setup [:create_buyer]

    test "redirects when data is valid", %{conn: conn, buyer: buyer} do
      conn = put conn, buyer_path(conn, :update, buyer), buyer: @update_attrs
      assert redirected_to(conn) == buyer_path(conn, :show, buyer)

      conn = get conn, buyer_path(conn, :show, buyer)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, buyer: buyer} do
      conn = put conn, buyer_path(conn, :update, buyer), buyer: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Buyer"
    end
  end

  describe "delete buyer" do
    setup [:create_buyer]

    test "deletes chosen buyer", %{conn: conn, buyer: buyer} do
      conn = delete conn, buyer_path(conn, :delete, buyer)
      assert redirected_to(conn) == buyer_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, buyer_path(conn, :show, buyer)
      end
    end
  end

  defp create_buyer(_) do
    buyer = fixture(:buyer)
    {:ok, buyer: buyer}
  end
end
