defmodule FerretRescue.Schemas.Application do
  @moduledoc """
  Schema for applications table.
  """
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{
          age: integer(),
          approved: boolean(),
          cage_info: String.t(),
          city: String.t(),
          diseases_info: String.t(),
          eat_info: String.t(),
          email: String.t(),
          final: boolean(),
          forever_home: String.t(),
          fostering: boolean(),
          heartworm_prevent: String.t(),
          heartworm_treat: boolean(),
          heartworms: boolean(),
          home_type: String.t(),
          kept_info: String.t(),
          landlord_info: String.t() | nil,
          legal_to_own: boolean(),
          move_info: String.t(),
          name: String.t(),
          notes: String.t() | nil,
          num_ferrets_info: String.t(),
          other_animals: String.t(),
          own_home: boolean(),
          owned_before: boolean(),
          owned_details: String.t() | nil,
          people_at_address: String.t(),
          phone_primary: String.t(),
          phone_secondary: String.t() | nil,
          play_info: String.t(),
          proofing_info: String.t(),
          reviewed: boolean(),
          smoker: boolean(),
          state: String.t(),
          street: String.t(),
          surrendered_details: String.t() | nil,
          surrendered: boolean(),
          time_at_address: String.t(),
          toy_info: String.t(),
          vaccines_current: boolean(),
          vet_info: String.t(),
          zip_code: integer()
        }

  schema "applications" do
    field :age, :integer
    field :approved, :boolean, default: false
    field :cage_info, :string
    field :city, :string
    field :diseases_info, :string
    field :eat_info, :string
    field :email, :string
    field :final, :boolean, default: false
    field :forever_home, :string
    field :fostering, :boolean
    field :heartworm_prevent, :string
    field :heartworm_treat, :boolean
    field :heartworms, :boolean
    field :home_type, :string
    field :kept_info, :string
    field :landlord_info, :string
    field :legal_to_own, :boolean
    field :move_info, :string
    field :name, :string
    field :notes, :string
    field :num_ferrets_info, :string
    field :other_animals, :string
    field :own_home, :boolean
    field :owned_before, :boolean
    field :owned_details, :string
    field :people_at_address, :string
    field :phone_primary, :string
    field :phone_secondary, :string
    field :play_info, :string
    field :proofing_info, :string
    field :reviewed, :boolean, default: false
    field :smoker, :boolean
    field :state, :string
    field :street, :string
    field :surrendered_details, :string
    field :surrendered, :boolean
    field :time_at_address, :string
    field :toy_info, :string
    field :vaccines_current, :boolean
    field :vet_info, :string
    field :zip_code, :integer

    has_many :messages, FerretRescue.Schemas.Message

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, attrs) do
    model
    |> cast(attrs, __schema__(:fields) -- [:id])
    |> validate_required(
      __schema__(:fields) --
        [
          :id,
          :inserted_at,
          :landlord_info,
          :notes,
          :owned_details,
          :phone_secondary,
          :surrendered_details,
          :updated_at
        ]
    )
    |> validate_number(:age, greater_than: 17)
    |> validate_landlord_info()
    |> validate_owned_details()
    |> validate_surrendered_details()
  end

  defp validate_landlord_info(changeset) do
    if get_field(changeset, :own_home) == false,
      do: validate_required(changeset, [:landlord_info]),
      else: changeset
  end

  defp validate_owned_details(changeset) do
    if get_field(changeset, :owned_before),
      do: validate_required(changeset, [:owned_details]),
      else: changeset
  end

  defp validate_surrendered_details(changeset) do
    if get_field(changeset, :surrendered),
      do: validate_required(changeset, [:surrendered_details]),
      else: changeset
  end
end
