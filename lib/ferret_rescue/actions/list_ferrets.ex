defmodule FerretRescue.Actions.ListFerrets do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Ferret
  alias FerretRescue.Repo

  @callback list_ferrets() :: [Ferret.t()]
  def list_ferrets() do
    from(Ferret, order_by: :name) |> Repo.all()
  end
end
