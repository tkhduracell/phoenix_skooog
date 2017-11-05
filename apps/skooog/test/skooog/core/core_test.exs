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

  describe "objects" do
    alias Skooog.Core.Object

    @valid_attrs %{area: "120.5", deforestation_confirmed_date: ~D[2010-04-17], deforestation_submission_date: ~D[2010-04-17], location: "some location", preliminary_volume: "120.5", sticks: true, sticks_volume: "120.5", supplier: "some supplier"}
    @update_attrs %{area: "456.7", deforestation_confirmed_date: ~D[2011-05-18], deforestation_submission_date: ~D[2011-05-18], location: "some updated location", preliminary_volume: "456.7", sticks: false, sticks_volume: "456.7", supplier: "some updated supplier"}
    @invalid_attrs %{area: nil, deforestation_confirmed_date: nil, deforestation_submission_date: nil, location: nil, preliminary_volume: nil, sticks: nil, sticks_volume: nil, supplier: nil}

    def object_fixture(attrs \\ %{}) do
      {:ok, object} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_object()

      object
    end

    test "list_objects/0 returns all objects" do
      object = object_fixture()
      assert Core.list_objects() == [object]
    end

    test "get_object!/1 returns the object with given id" do
      object = object_fixture()
      assert Core.get_object!(object.id) == object
    end

    test "create_object/1 with valid data creates a object" do
      assert {:ok, %Object{} = object} = Core.create_object(@valid_attrs)
      assert object.area == Decimal.new("120.5")
      assert object.deforestation_confirmed_date == ~D[2010-04-17]
      assert object.deforestation_submission_date == ~D[2010-04-17]
      assert object.location == "some location"
      assert object.preliminary_volume == Decimal.new("120.5")
      assert object.sticks == true
      assert object.sticks_volume == Decimal.new("120.5")
      assert object.supplier == "some supplier"
    end

    test "create_object/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_object(@invalid_attrs)
    end

    test "update_object/2 with valid data updates the object" do
      object = object_fixture()
      assert {:ok, object} = Core.update_object(object, @update_attrs)
      assert %Object{} = object
      assert object.area == Decimal.new("456.7")
      assert object.deforestation_confirmed_date == ~D[2011-05-18]
      assert object.deforestation_submission_date == ~D[2011-05-18]
      assert object.location == "some updated location"
      assert object.preliminary_volume == Decimal.new("456.7")
      assert object.sticks == false
      assert object.sticks_volume == Decimal.new("456.7")
      assert object.supplier == "some updated supplier"
    end

    test "update_object/2 with invalid data returns error changeset" do
      object = object_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_object(object, @invalid_attrs)
      assert object == Core.get_object!(object.id)
    end

    test "delete_object/1 deletes the object" do
      object = object_fixture()
      assert {:ok, %Object{}} = Core.delete_object(object)
      assert_raise Ecto.NoResultsError, fn -> Core.get_object!(object.id) end
    end

    test "change_object/1 returns a object changeset" do
      object = object_fixture()
      assert %Ecto.Changeset{} = Core.change_object(object)
    end
  end
end
