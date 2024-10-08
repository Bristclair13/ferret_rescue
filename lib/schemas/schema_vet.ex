defmodule FerretRescue.Schemas.Vet do
  @moduledoc """
  Schema for vets table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "vets" do
    field :city, :string
    field :company_name, :string
    field :notes, :string
    field :phone, :string
    field :state, :string
    field :street, :string
    field :vet_name, :string
    field :website, :string
    field :zip, :string

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, __schema__(:fields) -- [:id])
  end
end
