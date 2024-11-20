defmodule FerretRescue.Actions.GetAuth do
  @behaviour __MODULE__

  alias FerretRescue.Schemas.Auth
  alias FerretRescue.Repo

  @callback get_auth_by(Keyword.t()) :: {:ok, Auth.t()} | {:error, :auth_not_found}
  def get_auth_by(by) do
    case Repo.get_by(Auth, by) do
      auth when is_struct(auth) ->
        {:ok, auth}

      _error ->
        {:error, :auth_not_found}
    end
  end
end
