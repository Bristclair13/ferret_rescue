defmodule FerretRescueWeb.Middleware.Nav.Hook do
  @moduledoc false
  use FerretRescueWeb, :live_view

  def on_mount(:default, _params, _session, socket) do
    {:cont, attach_hook(socket, :active_tab, :handle_params, &set_active_tab/3)}
  end

  defp set_active_tab(_params, _url, socket) do
    active_tab =
      case socket.view do
        FerretRescueWeb.Live.Adopt ->
          :adopt

        FerretRescueWeb.Live.Contact ->
          :contact

        FerretRescueWeb.Live.Faq ->
          :faq

        FerretRescueWeb.Live.Fosters ->
          :foster

        FerretRescueWeb.Live.Home ->
          :home

        FerretRescueWeb.Live.Sitters ->
          :resources

        FerretRescueWeb.Live.Vets ->
          :resources

        _no_match ->
          nil
      end

    {:cont, assign(socket, active_tab: active_tab)}
  end
end
