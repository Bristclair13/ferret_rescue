defmodule FerretRescue.Faq.Storage do
  import Ecto.Query

  alias FerretRescue.Schemas.Topic
  alias FerretRescue.Schemas.Content
  alias FerretRescue.Repo

  @callback list_topics(String.t()) :: [Topic.t()]
  def list_topics() do
    from(Topic, order_by: :rank) |> Repo.all()
  end

  @callback list_content(String.t()) :: [Content.t()]
  def list_content() do
    from(Content, order_by: :rank) |> Repo.all()
  end
end
