defmodule FerretRescueWeb.Live.Admin do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <div class="flex justify-between max-w-6xl mx-auto">
        <p class="border-2 border-gray-400">#</p>
        <p class="border-2 border-gray-400">Name</p>
        <p class="border-2 border-gray-400">Email</p>
        <p class="border-2 border-gray-400">Reviewed</p>
        <p class="border-2 border-gray-400">Approved</p>
        <p class="border-2 border-gray-400">Final</p>
        <p class="border-2 border-gray-400 p-x-10 p-y-4"></p>
      </div>
    </div>
    """
  end
end
