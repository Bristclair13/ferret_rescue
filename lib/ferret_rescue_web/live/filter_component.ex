defmodule FerretRescueWeb.Live.FilterComponent do
  use FerretRescueWeb, :html

  def render(assigns) do
    ~H"""
    <div>
      <.form :let={f} for={@changeset} as={:filter} phx-change="search">
        <div>
          <.input field={f[:name]} label="Name" />
          <.input field={f[:email]} label="Email" />
        </div>
      </.form>
    </div>
    """
  end
end
