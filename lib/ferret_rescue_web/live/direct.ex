defmodule FerretRescueWeb.Live.DirectApplication do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Actions.GetApplication

  def mount(params, session, socket) do
    dbg(session)
    app_id = session["application_id"]
    {:ok, application} = GetApplication.get(app_id)
    {:ok, push_navigate(socket, to: ~p"/admin/application/#{application.id}")}
  end
end
