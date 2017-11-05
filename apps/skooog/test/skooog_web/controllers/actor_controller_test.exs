defmodule SkooogWeb.ActorControllerTest do
  use SkooogWeb.ConnCase

  alias Skooog.Core

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  def fixture(:actor) do
    {:ok, actor} = Core.create_actor(@create_attrs)
    actor
  end

  describe "index" do
    test "lists all actors", %{conn: conn} do
      conn = get conn, actor_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Actors"
    end
  end

  describe "new actor" do
    test "renders form", %{conn: conn} do
      conn = get conn, actor_path(conn, :new)
      assert html_response(conn, 200) =~ "New Actor"
    end
  end

  describe "create actor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, actor_path(conn, :create), actor: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == actor_path(conn, :show, id)

      conn = get conn, actor_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Actor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, actor_path(conn, :create), actor: @invalid_attrs
      assert html_response(conn, 200) =~ "New Actor"
    end
  end

  describe "edit actor" do
    setup [:create_actor]

    test "renders form for editing chosen actor", %{conn: conn, actor: actor} do
      conn = get conn, actor_path(conn, :edit, actor)
      assert html_response(conn, 200) =~ "Edit Actor"
    end
  end

  describe "update actor" do
    setup [:create_actor]

    test "redirects when data is valid", %{conn: conn, actor: actor} do
      conn = put conn, actor_path(conn, :update, actor), actor: @update_attrs
      assert redirected_to(conn) == actor_path(conn, :show, actor)

      conn = get conn, actor_path(conn, :show, actor)
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, actor: actor} do
      conn = put conn, actor_path(conn, :update, actor), actor: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Actor"
    end
  end

  describe "delete actor" do
    setup [:create_actor]

    test "deletes chosen actor", %{conn: conn, actor: actor} do
      conn = delete conn, actor_path(conn, :delete, actor)
      assert redirected_to(conn) == actor_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, actor_path(conn, :show, actor)
      end
    end
  end

  defp create_actor(_) do
    actor = fixture(:actor)
    {:ok, actor: actor}
  end
end
