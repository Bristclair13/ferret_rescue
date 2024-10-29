defmodule FerretRescue.Schemas.FaqTopic do
  @moduledoc """
  Schema for faq_topic table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          name: String.t(),
          rank: integer()
        }

  schema "faq_topics" do
    field :name, :string
    field :rank, :integer

    has_many :questions, FerretRescue.Schemas.FaqContent,
      foreign_key: :topic_id,
      preload_order: [:rank]

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :rank])
    |> validate_required([:name, :rank])
  end
end
