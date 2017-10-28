defmodule SkooogWeb.ObjectControllerTest do
  use SkooogWeb.ConnCase

  alias Skooog.Core

  @create_attrs %{area: "120.5", deforestation_confirmed_date: ~D[2010-04-17], deforestation_submission_date: ~D[2010-04-17], location: "some location", preliminary_volume: "120.5", sticks: true, sticks_volume: "120.5", supplier: "some supplier"}
  @update_attrs %{area: "456.7", deforestation_confirmed_date: ~D[2011-05-18], deforestation_submission_date: ~D[2011-05-18], location: "some updated location", preliminary_volume: "456.7", sticks: false, sticks_volume: "456.7", supplier: "some updated supplier"}
  @invalid_attrs %{area: nil, deforestation_confirmed_date: nil, deforestation_submission_date: nil, location: nil, preliminary_volume: nil, sticks: nil, sticks_volume: nil, supplier: nil}

  def fixture(:object) do
    {:ok, object} = Core.create_object(@create_attrs)
    object
  end

  describe "index" do
    test "lists all objects", %{conn: conn} do
      conn = get conn, object_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Objects"
    end
  end

  describe "new object" do
    test "renders form", %{conn: conn} do
      conn = get conn, object_path(conn, :new)
      assert html_response(conn, 200) =~ "New Object"
    end
  end

  describe "create object" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, object_path(conn, :create), object: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == object_path(conn, :show, id)

      conn = get conn, object_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Object"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, object_path(conn, :create), object: @invalid_attrs
      assert html_response(conn, 200) =~ "New Object"
    end
  end

  describe "edit object" do
    setup [:create_object]

    test "renders form for editing chosen object", %{conn: conn, object: object} do
      conn = get conn, object_path(conn, :edit, object)
      assert html_response(conn, 200) =~ "Edit Object"
    end
  end

  describe "update object" do
    setup [:create_object]

    test "redirects when data is valid", %{conn: conn, object: object} do
      conn = put conn, object_path(conn, :update, object), object: @update_attrs
      assert redirected_to(conn) == object_path(conn, :show, object)

      conn = get conn, object_path(conn, :show, object)
      assert html_response(conn, 200) =~ "some updated location"
    end

    test "renders errors when data is invalid", %{conn: conn, object: object} do
      conn = put conn, object_path(conn, :update, object), object: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Object"
    end
  end

  describe "delete object" do
    setup [:create_object]

    test "deletes chosen object", %{conn: conn, object: object} do
      conn = delete conn, object_path(conn, :delete, object)
      assert redirected_to(conn) == object_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, object_path(conn, :show, object)
      end
    end
  end

  defp create_object(_) do
    object = fixture(:object)
    {:ok, object: object}
  end
end
