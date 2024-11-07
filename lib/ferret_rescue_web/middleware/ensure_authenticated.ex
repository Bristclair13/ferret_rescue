defmodule FerretRescueWeb.MiddleWare.EnsureAuthenticated.Plug do
  import Phoenix.Controller
  import Plug.Conn

  alias FerretRescue.Repo
  alias FerretRescue.Schemas.Auth

  def init(_params) do
  end

  def call(conn, _params) do
    with auth_id when is_binary(auth_id) <- get_session(conn, :auth_id),
         {:ok, auth} <- Repo.get(Auth, auth_id) do
      assign(conn, :auth, auth)
    else
      _error ->
        redirect(conn, to: "/login") |> halt()
    end
  end
end
