defmodule FerretRescue.Faq.Storage do
  import Ecto.Query

  alias FerretRescue.Schemas.FaqTopic
  alias FerretRescue.Repo

  @callback list_topics(String.t()) :: [Topic.t()]
  def list_topics() do
    from(FaqTopic, order_by: :rank) |> Repo.all() |> Repo.preload(:questions)
  end
end
