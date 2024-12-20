defmodule FerretRescue.Schemas.Sitter do
  @moduledoc """
  Schema for sitters table.
  """
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{
          email: String.t(),
          name: String.t(),
          notes: String.t(),
          phone: String.t()
        }

  schema "sitters" do
    field :email, :string
    field :name, :string
    field :notes, :string
    field :phone, :string

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, __schema__(:fields) -- [:id])
    |> validate_required([:name])
  end
end
