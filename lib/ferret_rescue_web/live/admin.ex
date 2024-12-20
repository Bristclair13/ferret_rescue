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
    <div>
      <div class="flex max-w-6xl mx-auto mb-8">
        <div>
          <FerretRescueWeb.Live.FilterComponent.render
            id="filter"
            filter={@filter}
            changeset={@changeset}
          />
        </div>
        <div class="my-auto ml-8">
          <.button
            phx-click="change_include_filter"
            phx-value-include="needs_review"
            class={[
              "hover:text-white hover:bg-emerald-600",
              (@filter.include == "needs_review" && "text-white bg-emerald-600") ||
                "bg-white text-emerald-600"
            ]}
          >
            Needs Review
          </.button>
          <.button
            phx-click="change_include_filter"
            phx-value-include="all"
            class="bg-white text-emerald-600 hover:text-white hover:bg-emerald-600"
          >
            All Applications
          </.button>
        </div>
        <div class="my-auto ml-auto flex">
          <div>
            <.button
              phx-click="prev"
              class="mr-4 disabled:rounded-md disabled:bg-slate-400 px-3 py-2 disabled:text-sm disabled:font-semibold disabled:text-white disabled:shadow-sm"
              disabled={not @applications.has_prev}
            >
              Prev Page
            </.button>
          </div>
          <div>
            <.button
              phx-click="next"
              disabled={not @applications.has_next}
              class="disabled:rounded-md disabled:bg-slate-400 px-3 py-2 disabled:text-sm disabled:font-semibold disabled:text-white disabled:shadow-sm"
            >
              Next Page
            </.button>
          </div>
        </div>
      </div>
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
            <td>
              <.link
                navigate={~p"/admin/application/#{application.id}"}
                class="text-black underline p-2 my-2 rounded-full"
              >
                review
              </.link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end

  def handle_event("next", _params, socket) do
    page = socket.assigns.applications.page
    params = %{page: page + 1}
    {:noreply, push_patch(socket, to: ~p"/admin?#{params}")}
  end

  def handle_event("prev", _params, socket) do
    page = socket.assigns.applications.page
    params = %{page: page - 1}

    {:noreply, push_patch(socket, to: ~p"/admin?#{params}")}
  end

  def handle_event("search", %{"filter" => filter}, socket) do
    params = FilterForm.parse(filter)
    {:noreply, push_patch(socket, to: ~p"/admin?#{params}")}
  end

  def handle_event("change_include_filter", %{"include" => include}, socket) do
    filter = socket.assigns.filter
    params = Map.put(filter, :include, include)
    {:noreply, push_patch(socket, to: ~p"/admin?#{params}")}
  end
end
