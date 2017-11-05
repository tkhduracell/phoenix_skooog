defmodule Skooog.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Skooog.Auth.User

  schema "users" do
    
    field :type, :string
    field :username, :string
    field :password, :string, virtual: true
    field :crypted_password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :type, :password])
    |> validate_required([:username, :type, :password])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :crypted_password, Comeonin.Argon2.hashpwsalt(pass))
      _ ->
        changeset  
    end
  end
end
