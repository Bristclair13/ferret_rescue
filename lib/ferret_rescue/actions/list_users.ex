defmodule FerretRescue.Actions.ListUsers do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Auth
  alias FerretRescue.Repo

  @callback list_users() :: Auth.t() | nil
  def list_users() do
    from(Auth, order_by: :inserted_at) |> Repo.all()
  end
end
