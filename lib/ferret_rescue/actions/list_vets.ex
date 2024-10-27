defmodule FerretRescue.Actions.ListVets do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Vet
  alias FerretRescue.Repo

  @callback list_vets() :: [Vet.t()]
  def list_vets() do
    from(Vet, order_by: :company_name) |> Repo.all()
  end
end
