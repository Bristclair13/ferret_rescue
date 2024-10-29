defmodule FerretRescue.Actions.ListSitters do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Sitter
  alias FerretRescue.Repo

  @callback list_sitters() :: [Sitter.t()]
  def list_sitters() do
    from(Sitter, order_by: :name) |> Repo.all()
  end
end
