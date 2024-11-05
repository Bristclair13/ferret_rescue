defmodule FerretRescue.Actions.ListApplications do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Application
  alias FerretRescue.Pagination

  @callback list_applications(Keyword.t()) :: [Application.t()]
  def list_applications(opts) do
    from(a in Application)
    |> filter(opts[:filter])
    |> Pagination.all(opts[:page] || 1)
  end

  defp filter(query, opts) do
    query
    |> maybe_filter(opts[:name_or_email])
  end

  defp maybe_filter(query, name_or_email) when is_binary(name_or_email) and name_or_email != "" do
    query_string = "%#{name_or_email}%"
    where(query, [a], ilike(a.email, ^query_string) or ilike(a.name, ^query_string))
  end

  defp maybe_filter(query, _opts), do: query
end
