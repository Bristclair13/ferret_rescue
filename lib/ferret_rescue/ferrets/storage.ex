defmodule FerretRescue.Ferrets.Storage do
  import Ecto.Query

  alias FerretRescue.Schemas.Ferret
  alias FerretRescue.Repo

  @callback list_ferrets(String.t()) :: [Ferret.t()]
  def list_ferrets() do
    from(Ferret, order_by: :name) |> Repo.all()
  end
end
