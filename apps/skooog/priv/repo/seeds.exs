# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Skooog.Repo.insert!(%Skooog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


Skooog.Repo.insert!(%Skooog.Auth.User{ username: "admin", 
                                       crypted_password: Comeonin.Argon2.hashpwsalt("password"),
                                       type: "SuperAdmin"})