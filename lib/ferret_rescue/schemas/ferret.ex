defmodule FerretRescue.Schemas.Ferret do
  @moduledoc """
  Schema for ferrets table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          age_months: integer(),
          age_years: integer(),
          available: boolean(),
          bio: String.t(),
          fee: float(),
          foster: boolean(),
          gender: Enum.t(),
          image_uploaded: boolean(),
          name: String.t()
        }

  schema "ferrets" do
    field :age_months, :integer
    field :age_years, :integer
    field :available, :boolean
    field :bio, :string
    field :fee, :decimal
    field :foster, :boolean
    field :gender, Ecto.Enum, values: [:female, :male]
    field :image_uploaded, :boolean, default: false
    field :name, :string

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, __schema__(:fields) -- [:id])
    |> validate_required(__schema__(:fields) -- [:id, :bio, :inserted_at, :updated_at])
  end
end
