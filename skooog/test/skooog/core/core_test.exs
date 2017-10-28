defmodule Skooog.CoreTest do
  use Skooog.DataCase

  alias Skooog.Core

  describe "actors" do
    alias Skooog.Core.Actor

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def actor_fixture(attrs \\ %{}) do
      {:ok, actor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_actor()

      actor
    end

    test "list_actors/0 returns all actors" do
      actor = actor_fixture()
      assert Core.list_actors() == [actor]
    end

    test "get_actor!/1 returns the actor with given id" do
      actor = actor_fixture()
      assert Core.get_actor!(actor.id) == actor
    end

    test "create_actor/1 with valid data creates a actor" do
      assert {:ok, %Actor{} = actor} = Core.create_actor(@valid_attrs)
      assert actor.title == "some title"
    end

    test "create_actor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_actor(@invalid_attrs)
    end

    test "update_actor/2 with valid data updates the actor" do
      actor = actor_fixture()
      assert {:ok, actor} = Core.update_actor(actor, @update_attrs)
      assert %Actor{} = actor
      assert actor.title == "some updated title"
    end

    test "update_actor/2 with invalid data returns error changeset" do
      actor = actor_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_actor(actor, @invalid_attrs)
      assert actor == Core.get_actor!(actor.id)
    end

    test "delete_actor/1 deletes the actor" do
      actor = actor_fixture()
      assert {:ok, %Actor{}} = Core.delete_actor(actor)
      assert_raise Ecto.NoResultsError, fn -> Core.get_actor!(actor.id) end
    end

    test "change_actor/1 returns a actor changeset" do
      actor = actor_fixture()
      assert %Ecto.Changeset{} = Core.change_actor(actor)
    end
  end
end
