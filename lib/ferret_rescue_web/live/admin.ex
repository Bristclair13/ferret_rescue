defmodule FerretRescueWeb.Live.Admin do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Admin.Storage

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
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
      <tbody :for={application <- @applications}>
        <tr>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.id %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.name %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.email %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.reviewed %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.approved %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4"><%= application.final %></td>
          <td class="border border-neutral-800 bg-white px-12 py-4">review</td>
        </tr>
      </tbody>
    </table>
    """
  end

  def handle_params(_params, _url, socket) do
    {:noreply, assign_applications(socket)}
  end

  defp assign_applications(socket) do
    assign(socket, :applications, Storage.list_applications())
  end
end
