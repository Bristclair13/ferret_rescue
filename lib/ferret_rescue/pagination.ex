defmodule FerretRescue.Pagination do
  import Ecto.Query

  alias FerretRescue.Repo

  @per_page 20

  def all(query, page) when is_binary(page) do
    all(query, String.to_integer(page))
  end

  def all(query, page) do
    results = query(query, page)
    has_next = length(results) > @per_page
    has_prev = page > 1
    count = Repo.one(from(t in subquery(query), select: count("*")))

    %{
      has_next: has_next,
      has_prev: has_prev,
      prev_page: page - 1,
      page: page,
      next_page: page + 1,
      first: (page - 1) * @per_page + 1,
      last: Enum.min([page * @per_page, count]),
      count: count,
      list: Enum.slice(results, 0, @per_page)
    }
  end

  defp query(query, page) when is_binary(page) do
    query(query, String.to_integer(page))
  end

  defp query(query, page) do
    query
    |> limit(^(@per_page + 1))
    |> offset(^(@per_page * (page - 1)))
    |> Repo.all()
  end
end
