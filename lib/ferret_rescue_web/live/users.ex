defmodule FerretRescueWeb.Live.Users do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Schemas.Auth
  alias FerretRescue

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

    <table class="w-full mt-4">
      <thead>
        <tr>
          <th scope="col" class="border border-neutral-800 bg-white py-4">Email</th>
          <th scope="col" class="border border-neutral-800 bg-white py-4">
            Manage Applications
          </th>
          <th scope="col" class="border border-neutral-800 bg-white py-4">Manage Users</th>
          <th scope="col" class="border border-neutral-800 bg-white py-4">Manage Ferrets</th>
          <th scope="col" class="border border-neutral-800 bg-white py-4">Manage Website</th>
          <th scope="col" class="border border-neutral-800 bg-white py-4"></th>
        </tr>
      </thead>
      <tbody :for={user <- @users}>
        <tr>
          <td class="border border-neutral-800 bg-white py-4 px-4"><%= user.email %></td>
          <td class="border border-neutral-800 bg-white py-4 text-center">
            <%= if user.can_manage_applications do %>
              <.icon name="hero-check" class="size-5 inline-block text-yellow-500" />
            <% else %>
              <.icon name="hero-x-mark" class="size-5 inline-block text-red-500" />
            <% end %>
          </td>
          <td class="border border-neutral-800 bg-white py-4 text-center">
            <%= if user.can_manage_users do %>
              <.icon name="hero-check" class="size-5 inline-block" />
            <% else %>
              <.icon name="hero-x-mark" class="size-5 inline-block" />
            <% end %>
          </td>
          <td class="border border-neutral-800 bg-white py-4 text-center">
            <%= if user.can_manage_ferrets do %>
              <.icon name="hero-check" class="size-5 inline-block" />
            <% else %>
              <.icon name="hero-x-mark" class="size-5 inline-block" />
            <% end %>
          </td>
          <td class="border border-neutral-800 bg-white py-4 text-center">
            <%= if user.can_manage_website do %>
              <.icon name="hero-check" class="size-5 inline-block" />
            <% else %>
              <.icon name="hero-x-mark" class="size-5 inline-block" />
            <% end %>
          </td>
          <td class="border border-neutral-800 bg-white py-4">
            <div class="flex gap-2 items-center justify-center">
              <.button phx-click="reset_password" class="text-blue-500 text-sm">
                reset password
              </.button>
              <p class="text-neutral-800 text-sm">|</p>
              <.button phx-click="delete_user" class="text-red-500 text-sm">
                delete
              </.button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end

  def handle_event("add_user", params, socket) do
    dbg(params)

    params = %{
      email: params["auth"]["email"],
      can_manage_applications: false,
      can_manage_users: false,
      can_manage_ferrets: false,
      can_manage_website: false
    }

    {:ok, auth} = FerretRescue.create_auth(params)

    users = Map.put(socket.assigns.users, auth.id, auth.id)
    socket |> assign(users: users) |> noreply()
  end
end
