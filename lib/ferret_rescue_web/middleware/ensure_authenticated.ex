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
        redirect(conn, to: "/auth/login") |> halt()
    end
  end
end

defmodule FerretRescueWeb.MiddleWare.EnsureAuthenticated.Hook do
  @moduledoc false
  use FerretRescueWeb, :live_view

  alias FerretRescue.Actions.GetAuth

  def on_mount(:default, _params, session, socket) do
    {:ok, auth} =
      GetAuth.get_by(id: session["auth_id"])

    {:cont,
     assign(socket,
       auth: auth
     )}
  end
end
