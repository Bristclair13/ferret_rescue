defmodule FerretRescue.Schemas.Auth do
  @moduledoc """
  Schema for auth table.
  """
  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{
          can_manage_applications: boolean() | nil,
          can_manage_ferrets: boolean() | nil,
          can_manage_users: boolean() | nil,
          can_manage_website: boolean() | nil,
          email: String.t() | nil,
          password: String.t(),
          inserted_at: DateTime.t(),
          updated_at: DateTime.t()
        }

  schema "auth" do
    field :can_manage_applications, :boolean, default: false
    field :can_manage_ferrets, :boolean, default: false
    field :can_manage_users, :boolean, default: false
    field :can_manage_website, :boolean, default: false
    field :email, :string
    field :password, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, __schema__(:fields) -- [:id])
    |> validate_required(__schema__(:fields) -- [:id, :password, :inserted_at, :updated_at])
    |> validate_length(:password, min: 12, message: "should be at least 12 characters")
    |> hash_password()
    |> unique_constraint(:email, name: :auth_email_index)
  end

  defp hash_password(%{changes: %{password: plain_text}} = changeset) do
    put_change(changeset, :password, Bcrypt.hash_pwd_salt(plain_text))
  end

  defp hash_password(changeset), do: changeset
end
