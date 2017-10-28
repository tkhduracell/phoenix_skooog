defmodule Skooog.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias Skooog.Repo

  alias Skooog.Core.Actor

  @doc """
  Returns the list of actors.

  ## Examples

      iex> list_actors()
      [%Actor{}, ...]

  """
  def list_actors do
    Repo.all(Actor)
  end

  @doc """
  Gets a single actor.

  Raises `Ecto.NoResultsError` if the Actor does not exist.

  ## Examples

      iex> get_actor!(123)
      %Actor{}

      iex> get_actor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_actor!(id), do: Repo.get!(Actor, id)

  @doc """
  Creates a actor.

  ## Examples

      iex> create_actor(%{field: value})
      {:ok, %Actor{}}

      iex> create_actor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_actor(attrs \\ %{}) do
    %Actor{}
    |> Actor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a actor.

  ## Examples

      iex> update_actor(actor, %{field: new_value})
      {:ok, %Actor{}}

      iex> update_actor(actor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_actor(%Actor{} = actor, attrs) do
    actor
    |> Actor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Actor.

  ## Examples

      iex> delete_actor(actor)
      {:ok, %Actor{}}

      iex> delete_actor(actor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_actor(%Actor{} = actor) do
    Repo.delete(actor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking actor changes.

  ## Examples

      iex> change_actor(actor)
      %Ecto.Changeset{source: %Actor{}}

  """
  def change_actor(%Actor{} = actor) do
    Actor.changeset(actor, %{})
  end

  alias Skooog.Core.Buyer

  @doc """
  Returns the list of buyers.

  ## Examples

      iex> list_buyers()
      [%Buyer{}, ...]

  """
  def list_buyers do
    Repo.all(Buyer)
  end

  @doc """
  Gets a single buyer.

  Raises `Ecto.NoResultsError` if the Buyer does not exist.

  ## Examples

      iex> get_buyer!(123)
      %Buyer{}

      iex> get_buyer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_buyer!(id), do: Repo.get!(Buyer, id)

  @doc """
  Creates a buyer.

  ## Examples

      iex> create_buyer(%{field: value})
      {:ok, %Buyer{}}

      iex> create_buyer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_buyer(attrs \\ %{}) do
    %Buyer{}
    |> Buyer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a buyer.

  ## Examples

      iex> update_buyer(buyer, %{field: new_value})
      {:ok, %Buyer{}}

      iex> update_buyer(buyer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_buyer(%Buyer{} = buyer, attrs) do
    buyer
    |> Buyer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Buyer.

  ## Examples

      iex> delete_buyer(buyer)
      {:ok, %Buyer{}}

      iex> delete_buyer(buyer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_buyer(%Buyer{} = buyer) do
    Repo.delete(buyer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking buyer changes.

  ## Examples

      iex> change_buyer(buyer)
      %Ecto.Changeset{source: %Buyer{}}

  """
  def change_buyer(%Buyer{} = buyer) do
    Buyer.changeset(buyer, %{})
  end

  alias Skooog.Core.Object

  @doc """
  Returns the list of objects.

  ## Examples

      iex> list_objects()
      [%Object{}, ...]

  """
  def list_objects do
    Repo.all(Object)
  end

  @doc """
  Gets a single object.

  Raises `Ecto.NoResultsError` if the Object does not exist.

  ## Examples

      iex> get_object!(123)
      %Object{}

      iex> get_object!(456)
      ** (Ecto.NoResultsError)

  """
  def get_object!(id), do: Repo.get!(Object, id)

  @doc """
  Creates a object.

  ## Examples

      iex> create_object(%{field: value})
      {:ok, %Object{}}

      iex> create_object(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_object(attrs \\ %{}) do
    %Object{}
    |> Object.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a object.

  ## Examples

      iex> update_object(object, %{field: new_value})
      {:ok, %Object{}}

      iex> update_object(object, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_object(%Object{} = object, attrs) do
    object
    |> Object.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Object.

  ## Examples

      iex> delete_object(object)
      {:ok, %Object{}}

      iex> delete_object(object)
      {:error, %Ecto.Changeset{}}

  """
  def delete_object(%Object{} = object) do
    Repo.delete(object)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking object changes.

  ## Examples

      iex> change_object(object)
      %Ecto.Changeset{source: %Object{}}

  """
  def change_object(%Object{} = object) do
    Object.changeset(object, %{})
  end
end
