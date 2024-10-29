defmodule FerretRescueWeb.LoginController do
  use FerretRescueWeb, :controller

  def login(conn, _params) do
    render(conn, :login, layout: false)
  end

  def handle_login(conn, %{"email" => email, "password" => password}) do
    case FerretRescue.login(email, password) do
      {:ok, auth} -> conn |> put_session(:auth_id, auth.id) |> redirect(to: ~p"/admin")
      _error -> render(conn, :login, layout: false, error: "invalid login")
    end
  end
end
