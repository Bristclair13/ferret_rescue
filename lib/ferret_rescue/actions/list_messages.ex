defmodule FerretRescue.Actions.ListMessages do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Message
  alias FerretRescue.Repo

  @callback list_messages(String.t()) :: Message.t() | nil
  def list_messages(application_id) do
    query =
      from m in Message,
        where: m.application_id == ^application_id,
        order_by: [asc: m.sent_at]

    Repo.all(query)
  end
end
