defmodule FerretRescue.Actions.SendMessage do
  alias FerretRescue.Schemas.Message
  alias FerretRescue.Repo

  @callback send_message(map()) :: {:ok, %Message{}} | {:error, Ecto.Changeset.t()}
  def send_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end
end
