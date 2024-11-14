defmodule FerretRescue.Actions.GetApplication do
  @behaviour __MODULE__

  alias FerretRescue.Schemas.Application
  alias FerretRescue.Repo

  @callback get(String.t()) :: Application.t() | nil
  def get(id) do
    Repo.get(Application, id)
  end
end
