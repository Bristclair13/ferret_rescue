defmodule FerretRescueWeb.MiddleWare.EnsureAuthenticated.Plug do
  import Phoenix.Controller
  import Plug.Conn

  alias FerretRescue.Repo
  alias FerretRescue.Schemas.Auth
  alias FerretRescue.Actions.GetAuth

  def init(_opts) do
  end

  def call(conn, _opts) do
    auth_id = get_session(conn, :auth_id)

    cond do
      auth = auth_id && Repo.get(Auth, auth_id) ->
        assign(conn, :auth, auth)

      true ->
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
