defmodule FerretRescue.Actions.CreateAuth do
  @behaviour __MODULE__

  alias FerretRescue.Schemas.Auth
  alias FerretRescue.Repo

  @callback create_auth(Keyword.t()) ::
              {:ok, Auth.t()} | {:error, :auth_not_found}
  def create_auth(params) do
    params
    |> Auth.changeset()
    |> Repo.insert()
  end
end
