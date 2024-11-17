defmodule FerretRescueWeb.MiddleWare.EnsureAuthenticated.Plug do
  import Phoenix.Controller
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    with auth_id when is_integer(auth_id) <- get_session(conn, :auth_id),
         {:ok, auth} <- FerretRescue.get_auth_by(id: auth_id) do
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

  def on_mount(:default, _params, session, socket) do
    with {:ok, auth} <- FerretRescue.get_auth_by(id: session["auth_id"]) do
      {:cont, assign(socket, auth: auth)}
    else
      _error ->
        {:halt, redirect(socket, to: "/auth/login")}
    end
  end
end
