defmodule FerretRescue.Admin.Storage do
  alias FerretRescue.Schemas.Application
  alias FerretRescue.Repo

  @callback list_applications() :: [Application.t()]
  def list_applications() do
    Repo.all(Application)
  end
end
