defmodule FerretRescueWeb.Live.Sitter do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Resources.Sitters.Storage

  def mount(_params, _session, socket) do
    sitters = Storage.list_sitters()
    {:ok, assign(socket, sitters: sitters)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-6xl mx-auto">
      <h3 class="text-3xl text-center">Ferret Sitters</h3>
      <p class="text-center font-light mt-6 bg-white p-6 shadow-lg">
        We do not guarantee any of these sitters, you are fully responsible for ensuring the sitter fits your needs. By using this website to find a sitter you agree to not hold us responsible for the actions of these sitters.
      </p>
      <div :for={sitter <- @sitters}>
        <div class="grid grid-cols-2">
          <div class="flex flex-col mt-6 mr-6 p-6 bg-white shadow-lg border-2 border-black">
            <div class="flex justify-between">
              <p><%= sitter.name() %></p>
              <a href="tel:+19723107440" class="hover:underline text-blue-400 hover:text-blue-500">
                <%= sitter.phone() %>
              </a>
            </div>
            <div>
              <a
                href="mailto:txflrvp@gmail.com"
                class="hover:underline text-blue-400 hover:text-blue-500"
              >
                <%= sitter.email() %>
              </a>
              <p class="font-bold mt-3">Info:</p>
              <p class="font-light">
                <%= sitter.notes() %>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
