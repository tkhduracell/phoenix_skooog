defmodule SkooogWeb.AuthHelpers do

    def logged_in(conn) do 
        case Guardian.Plug.current_resource(conn) do
            %Skooog.Auth.User{} -> true
            _ -> false
        end
    end

end