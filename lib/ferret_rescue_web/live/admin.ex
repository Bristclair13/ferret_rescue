defmodule FerretRescueWeb.Live.Admin do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Actions.ListApplications
  alias FerretRescueWeb.Forms.FilterForm

  def handle_params(params, _url, socket) do
    filter =
      params
      |> FilterForm.parse()
      |> FilterForm.default_values()

    applications =
      ListApplications.list_applications(filter: filter, page: params["page"] || 1)

    {:noreply,
     assign(socket,
       changeset: FilterForm.change_values(filter),
       applications: applications,
       filter: filter
     )}
  end

  def render(assigns) do
    ~H"""
    <FerretRescueWeb.Live.FilterComponent.render id="filter" filter={@filter} changeset={@changeset} />
    <table class="max-w-6xl mx-auto">
      <thead class="border border-neutral-800 font-medium">
        <tr>
          <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">#</th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Name</th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Email</th>
          <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">Reviewed</th>
          <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">Approved</th>
          <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">Final</th>
          <th scope="col" class="border border-neutral-800 bg-white px-12 py-4"></th>
        </tr>
      </thead>
      <tbody :for={application <- @applications.list}>
        <tr>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.id %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.name %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.email %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4">
            <%= if application.reviewed, do: "yes", else: "no" %>
          </td>
          <td class="border border-neutral-800 bg-white px-12 py-4">
            <%= if application.approved, do: "yes", else: "no" %>
          </td>
          <td class="border border-neutral-800 bg-white px-12 py-4">
            <%= if application.final, do: "yes", else: "no" %>
          </td>
          <td class="border border-neutral-800 bg-white px-12 py-4">review</td>
        </tr>
      </tbody>
    </table>
    """
  end

  def handle_event("search", %{"filter" => filter}, socket) do
    params = FilterForm.parse(filter)
    {:noreply, push_patch(socket, to: ~p"/admin?#{params}")}
  end
end
