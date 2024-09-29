defmodule FerretRescue.Schemas.Message do
  @moduledoc """
  Schema for messages table.
  """
  use Ecto.Schema

  import Ecto.Changeset

  schema "messages" do
    field :message, :string

    belongs_to :application, FerretRescue.Schemas.Application

    timestamps(inserted_at: :sent_at, updated_at: false)
  end

  def changeset(model, attrs) do
    model
    |> cast(attrs, __schema__(:fields) -- [:id])
    |> validate_required([:message])
  end
end
