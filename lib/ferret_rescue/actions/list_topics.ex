defmodule FerretRescue.Actions.ListTopics do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.FaqTopic
  alias FerretRescue.Repo

  @callback list_topics() :: [Topic.t()]
  def list_topics() do
    from(FaqTopic, order_by: :rank) |> Repo.all() |> Repo.preload(:questions)
  end
end
