defmodule FerretRescue.Actions.ListMessages do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Message
  alias FerretRescue.Repo

  @callback list_messages() :: Message.t() | nil
  def list_messages() do
    # TODO: filter by application id
    from(Message, order_by: :sent_at) |> Repo.all()
  end
end
