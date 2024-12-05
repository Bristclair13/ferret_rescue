defmodule FerretRescueWeb.Live.Users do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button phx-click="add-user">Add User</.button>
    """
  end
end
