defmodule FerretRescueWeb.Live.FilterComponent do
  use FerretRescueWeb, :html

  def render(assigns) do
    ~H"""
    <div>
      <.form :let={f} for={@changeset} as={:filter} phx-change="search">
        <div>
          <.input field={f[:name_or_email]} label="Search by name or email" />
        </div>
      </.form>
    </div>
    """
  end
end
