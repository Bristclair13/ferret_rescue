defmodule FerretRescueWeb.Live.Application do
  use FerretRescueWeb, :admin_live_view

  alias FerretRescue.Actions.GetApplication

  def mount(%{"application_id" => application_id}, _session, socket) do
    application = GetApplication.get(application_id)
    {:ok, assign(socket, application: application)}
  end

  def render(assigns) do
    ~H"""
    <div><%= @application.name %></div>
    """
  end
end
