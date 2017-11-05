defmodule Skooog.Auth.Login do
    @moduledoc """
    The Auth context.
    """

    def login(username, password, repo) do
        
        # try to get user by unique email from DB
        user = repo.get_by(Skooog.Auth.User, %{username: username})
        
        case user do
            nil -> 
                # simulate check password hash timing
                Comeonin.Argon2.dummy_checkpw
                {:error, :not_found}

            user -> 
                case Comeonin.Argon2.checkpw(password, user.crypted_password) do
                    true -> {:ok, user}
                    false -> {:error, :invalid_password}
                end
        end
    end

end