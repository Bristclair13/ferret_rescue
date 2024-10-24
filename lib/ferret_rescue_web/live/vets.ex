defmodule FerretRescueWeb.Live.Vets do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Resources.Vets.Storage

  def mount(_params, _session, socket) do
    vets = Storage.list_vets()
    {:ok, assign(socket, vets: vets)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-6xl mx-auto">
      <div class="text-3xl mx-auto">Emergency Animal Clinic</div>
      <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
        <div class="flex justify-between">
          <a
            href="https://veterinaryemergencygroup.com/locations/dallas-tx/"
            class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
            target="_blank"
          >
            Veterinary Emergency Group
          </a>
          <a href="tel:+19725447311" class="hover:underline text-blue-400 hover:text-blue-500">
            (972) 544-7311
          </a>
        </div>
        <div class="mt-3">
          <p>4500 North Central Expwy</p>
          <p>Dallas, TX 75206</p>
          <p class="mt-3">Open 24/7</p>
        </div>
      </div>
      <h3 class="mt-6 text-center text-3xl">Ferret Specialists</h3>
      <div class="grid grid-cols-2 gap-x-6">
        <div :for={vet <- @vets}>
          <div class="flex flex-col mx-auto my-3 p-6 bg-white shadow-lg mx-3">
            <div class="flex justify-between">
              <div :if={is_nil(vet.website)}>
                <p class="text-xl"><%= vet.company_name %></p>
              </div>
              <div :if={not is_nil(vet.website)}>
                <a
                  href={vet.website}
                  class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
                  target="_blank"
                >
                  <%= vet.company_name %>
                </a>
              </div>
              <a href={"tel:+1#{vet.phone}"} class="hover:underline text-blue-400 hover:text-blue-500">
                <%= vet.phone %>
              </a>
            </div>
            <div class="mt-3">
              <p><%= vet.vet_name %></p>
              <p class="mt-3"><%= vet.street %></p>
              <p><%= vet.city %>, <%= vet.state %>, <%= vet.zip %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
