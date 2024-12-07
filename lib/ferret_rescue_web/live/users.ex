defmodule FerretRescueWeb.Live.Users do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Schemas.Auth

  def mount(_params, _session, socket) do
    changeset = Auth.changeset(%{})
    users = FerretRescue.list_users()

    {:ok, socket, changeset: changeset, users: users}
  end

  def render(assigns) do
    ~H"""
    <.button
      phx-click={toggle("#add-user-form")}
      class="text-white bg-emerald-600 rounded-md text-sm font-semibold shadow-sm disabled:rounded-md disabled:bg-slate-400 px-3 py-2 disabled:text-sm disabled:font-semibold disabled:text-white disabled:shadow-sm"
    >
      Add User
    </.button>

    <div
      id="add-user-form"
      class="hidden absolute z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
    >
      <.form :let={f} for={@changeset} phx-submit="add_user">
        <.input field={f[:email]} type="textarea" label="email" />
        <.button class="mt-4 px-2 py-1 text-white bg-green-500 hover:bg-green-600 rounded-md">
          Create
        </.button>
      </.form>
    </div>
    """
  end
end
