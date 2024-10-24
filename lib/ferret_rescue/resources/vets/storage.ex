defmodule FerretRescue.Resources.Vets.Storage do
  import Ecto.Query

  alias FerretRescue.Schemas.Vet
  alias FerretRescue.Repo

  @callback list_vets(String.t()) :: [Vet.t()]
  def list_vets() do
    from(Vet, order_by: :company_name) |> Repo.all()
  end
end
