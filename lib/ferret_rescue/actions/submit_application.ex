defmodule FerretRescue.Actions.SubmitApplication do
  alias FerretRescue.Schemas.Application
  alias FerretRescue.Repo

  @callback submit_application(map()) :: {:ok, %Application{}} | {:error, Ecto.Changeset.t()}
  def submit_application(attrs) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end
end
