defmodule FerretRescue.Actions.ListApplications do
  @behaviour __MODULE__

  import Ecto.Query

  alias FerretRescue.Schemas.Application
  alias FerretRescue.Repo

  @callback list_applications(String.t()) :: [Application.t()]
  def list_applications(opts) do
    from(a in Application)
    |> filter(opts)
    |> Repo.all()
  end

  defp filter(query, opts) do
    query
    |> maybe_filter_by_email(opts)
    |> maybe_filter_by_name(opts)
  end

  defp maybe_filter_by_email(query, %{email: email}) when is_binary(email) and email != "" do
    query_string = "%#{email}%"
    where(query, [a], ilike(a.email, ^query_string))
  end

  defp maybe_filter_by_email(query, _opts), do: query

  defp maybe_filter_by_name(query, %{name: name}) when is_binary(name) and name != "" do
    query_string = "%#{name}%"
    where(query, [a], ilike(a.name, ^query_string))
  end

  defp maybe_filter_by_name(query, _opts), do: query
end