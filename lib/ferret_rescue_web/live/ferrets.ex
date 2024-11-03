defmodule FerretRescueWeb.Live.Ferrets do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Actions.ListFerrets

  def mount(_params, _session, socket) do
    ferrets = ListFerrets.list_ferrets()
    {:ok, assign(socket, ferrets: ferrets)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-6">
      <p class="max-w-6xl mx-auto p-6 bg-white shadow-lg">
        ALL ferrets have their rabies and distemper vaccination, are microchipped, and have had a health exam to check for teeth, heart, or tumor problems. Ferrets are guaranteed for 30 days against illness and 3 months against adrenal tumors.
      </p>
      <div :for={ferret <- @ferrets}>
        <div class="max-w-6xl w-full mx-auto shadow-lg bg-white flex p-6">
          <div class="flex flex-col mr-8">
            <img src="/images/ferret-1.jpg" class="w-36" />
            <.link
              navigate={~p"/adopt"}
              class="mx-auto mt-4 w-32 p-2 bg-emerald-600 hover:bg-emerald-700 rounded-md text-white"
            >
              Apply to Adopt
            </.link>
          </div>
          <div>
            <p class="text-2xl mb-4"><%= ferret.name %></p>
            <p>
              <span class="font-bold">Age:</span> <%= ferret.age_years %> years <%= ferret.age_months %> months
            </p>
            <p><span class="font-bold">Gender:</span> <%= ferret.gender %></p>
            <p class="mb-4"><span class="font-bold">Adoption Fee:</span> <%= ferret.fee %></p>
            <p>
              <%= ferret.bio %>
            </p>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
