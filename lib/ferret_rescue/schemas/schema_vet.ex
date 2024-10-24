defmodule FerretRescue.Schemas.Vet do
  @moduledoc """
  Schema for vets table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          city: String.t() | nil,
          company_name: String.t() | nil,
          notes: String.t() | nil,
          phone: String.t() | nil,
          state: String.t() | nil,
          street: Stirng.t() | nil,
          vet_name: String.t() | nil,
          website: String.t() | nil,
          zip: String.t() | nil,
          inserted_at: DateTime.t(),
          updated_at: DateTime.t()
        }

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
