defmodule FerretRescue.Actions.ListApplications do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Application
  alias FerretRescue.Utils.Pagination

  @callback list_applications(Keyword.t()) :: map()
  def list_applications(opts) do
    from(a in Application)
    |> filter(opts[:filter])
    |> Pagination.all(opts[:page] || 1)
  end

  defp filter(query, opts) do
    query
    |> maybe_filter_name_or_email(opts[:name_or_email])
    |> maybe_filter_include(opts[:include])
  end

  defp maybe_filter_name_or_email(query, name_or_email)
       when is_binary(name_or_email) and name_or_email != "" do
    query_string = "%#{name_or_email}%"
    where(query, [a], ilike(a.email, ^query_string) or ilike(a.name, ^query_string))
  end

  defp maybe_filter_name_or_email(query, _opts), do: query

  defp maybe_filter_include(query, "needs_review") do
    where(query, [a], not a.final)
  end

  defp maybe_filter_include(query, _opts), do: query
end
