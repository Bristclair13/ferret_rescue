defmodule FerretRescueWeb.Live.Users do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Schemas.Auth

  def mount(_params, _session, socket) do
    changeset = Auth.changeset(%{})
    users = FerretRescue.list_users()

    {:ok, assign(socket, changeset: changeset, users: users)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.button
        phx-click={toggle("#add-user-form")}
        class="text-white bg-emerald-600 rounded-md text-sm font-semibold shadow-sm disabled:rounded-md disabled:bg-slate-400 px-3 py-2 disabled:text-sm disabled:font-semibold disabled:text-white disabled:shadow-sm"
      >
        Add User
      </.button>

      <div id="add-user-form" class="hidden absolute mt-2 rounded-md bg-white shadow-lg p-2">
        <.form :let={f} for={@changeset} phx-submit="add_user">
          <.input field={f[:email]} type="textarea" label="email" />
          <.button class="mt-4 px-2 py-1 text-white bg-green-500 hover:bg-green-600 rounded-md">
            Create
          </.button>
        </.form>
      </div>
    </div>

    <table>
      <thead>
        <tr>
          <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">Email</th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">
            Manage Applications
          </th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Manage Users</th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Manage Ferrets</th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Manage Website</th>
          <th scope="col" class="border border-neutral-800 bg-white px-24 py-4"></th>
        </tr>
      </thead>
      <tbody :for={user <- @users}>
        <tr>
          <td class="border border-neutral-800 bg-white px-24 py-4"><%= user.email %></td>
          <td class="border border-neutral-800 bg-white px-24 py-4">
            <%= user.can_manage_applications %>
          </td>
          <td class="border border-neutral-800 bg-white px-24 py-4"><%= user.can_manage_users %></td>
          <td class="border border-neutral-800 bg-white px-24 py-4">
            <%= user.can_manage_ferrets %>
          </td>
          <td class="border border-neutral-800 bg-white px-24 py-4">
            <%= user.can_manage_website %>
          </td>
          <td class="border border-neutral-800 bg-white px-24 py-4"></td>
        </tr>
      </tbody>
    </table>
    """
  end
end
