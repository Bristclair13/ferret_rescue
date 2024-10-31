# defmodule FerretRescueWeb.MiddleWare.EnsureAuthenticated.Plug do
#   import Phoenix.Controller
#   import Plug.Conn

#   alias FerretRescue.Repo
#   alias FerretRescue.Schemas.Auth

#   def init(_params) do
#   end

#   def call(conn, _params) do
#     auth_id = Plug.Conn.get_session(conn, :auth_id)

#     cond do
#       auth = auth_id && Repo.get(Auth, auth_id) ->
#         conn
#         |> assign(:auth, auth)
#     else
#       _error ->
#         render(conn, :login, layout: false, error: "invalid login")
#     end
#   end
# end
