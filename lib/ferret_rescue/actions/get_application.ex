defmodule FerretRescue.Actions.GetApplication do
  @behaviour __MODULE__

  alias FerretRescue.Schemas.Application
  alias FerretRescue.Repo

  @callback get_application(String.t()) :: Application.t() | nil
  def get_application(id) do
    Repo.get(Application, id)
  end
end
