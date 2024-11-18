defmodule FerretRescue.Actions.GetApplication do
  @behaviour __MODULE__

  alias FerretRescue.Schemas.Application
  alias FerretRescue.Repo

  @callback get_application_by(Keyword.t()) ::
              {:ok, Application.t()} | {:error, :application_not_found}
  def get_application_by(by) do
    case Repo.get_by(Application, by) do
      application when is_struct(application) ->
        {:ok, application}

      _error ->
        {:error, :application_not_found}
    end
  end
end
