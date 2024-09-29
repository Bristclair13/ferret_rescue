defmodule FerretRescueWeb.Live.Faq do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="max-w-6xl mx-auto flex flex-col">
      <h3 class="text-3xl">Frequently Asked Questions</h3>
      <div class="mt-2 p-4 shadow-lg bg-white flex flex-col">
        <div>
          <h3 class="text-3xl">Basic</h3>
        </div>
        <div class="mt-6">
          <h3 class="text-3xl">Adoption</h3>
        </div>
        <div class="mt-6">
          <h3 class="text-3xl">Surrender</h3>
        </div>
        <div class="mt-6">
          <h3 class="text-3xl">Training</h3>
        </div>
        <div class="mt-6">
          <h3 class="text-3xl">Miscellaneous</h3>
        </div>
      </div>
    </div>
    """
  end
end
