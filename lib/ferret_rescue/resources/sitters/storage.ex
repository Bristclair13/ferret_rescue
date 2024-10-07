defmodule FerretRescue.Resources.Vets.Storage do
  import Ecto.Query

  alias FerretRescue.Schemas.Sitter
  alias FerretRescue.Repo

  @callback list_sitters(String.t()) :: [Sitter.t()]
  def list_sitters() do
    from(Sitter, order_by: :name) |> Repo.all()
  end
end
