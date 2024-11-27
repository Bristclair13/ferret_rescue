defmodule FerretRescue.Actions.SendMessage do
  alias FerretRescue.Schemas.Message
  alias FerretRescue.Repo

  @callback send_message(map()) :: {:ok, %Message{}} | {:error, Ecto.Changeset.t()}
  def send_message(params) do
    %Message{}
    |> Message.changeset(params)
    |> Repo.insert()
  end
end
