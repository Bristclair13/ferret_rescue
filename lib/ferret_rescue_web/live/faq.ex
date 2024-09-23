defmodule FerretRescueWeb.Live.Faq do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="max-w-6xl mx-auto flex flex-col">
      <h3 class="text-3xl">Frequently Asked Questions</h3>
      <div class="mt-2 p-4 shadow-lg bg-white">
        <h3 class="text-3xl">Basic</h3>
      </div>
    </div>
    """
  end
end
