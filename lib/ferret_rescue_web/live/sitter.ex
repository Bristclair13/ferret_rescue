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
      <div class="flex">
        <div class="flex flex-col w-1/2 mt-6 mr-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p>Barbara Bullock</p>
            <a href="tel:+19723107440" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 310-7440
            </a>
          </div>
          <div>
            <a
              href="mailto:txflrvp@gmail.com"
              class="hover:underline text-blue-400 hover:text-blue-500"
            >
              txflrvp@gmail.com
            </a>
            <p class="font-bold mt-3">Info:</p>
            <p class="font-light">
              Located in Plano area. Has private, separate room for the ferrets. Experience with medically challenged ferrets and behavioral issues.
            </p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p>Jenn Solberg</p>
            <a href="tel:+12143369984" class="hover:underline text-blue-400 hover:text-blue-500">
              214-336-9984
            </a>
          </div>
          <div>
            <a
              href="mailto:Jenn3246@att.net"
              class="hover:underline text-blue-400 hover:text-blue-500"
            >
              Jenn3246@att.net
            </a>
            <p class="font-bold mt-3">Info:</p>
            <p class="font-light">
              Located in North Central Dallas. Serves DFW area. I have extensive experience with both Medical and behavior issues.
            </p>
          </div>
        </div>
      </div>
      <div class="w-1/2 mt-6 p-6 bg-white shadow-lg">
        <div class="flex justify-between">
          <p>Kim Droptini</p>
          <a href="tel:+12145144411" class="hover:underline text-blue-400 hover:text-blue-500">
            (214) 514-4411
          </a>
        </div>
        <div>
          <a
            href="mailto:Kdroptini@outlook.com"
            class="hover:underline text-blue-400 hover:text-blue-500"
          >
            Kdroptini@outlook.com
          </a>
          <p class="font-bold mt-3">Info:</p>
          <p class="font-light">
            Tarrant County area. Foster for the rescue so I have experience with ferrets with medical needs.
          </p>
        </div>
      </div>
      <div class="w-1/2 mx-auto mt-6 text-lg">
        For further ferret sitting options, see the Facebook page, Ferret Sitters Connections.
        <span>
          <a
            href="https://www.facebook.com/groups/344263992897139"
            class="hover:underline text-blue-400 hover:text-blue-500"
          >
            https://www.facebook.com/groups/344263992897139
          </a>
        </span>
      </div>
    </div>
    """
  end
end
