defmodule FerretRescueWeb.Live.Ferrets do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-6">
      <p class="max-w-6xl mx-auto p-6 bg-white shadow-lg">
        ALL ferrets have their rabies and distemper vaccination, are microchipped, and have had a health exam to check for teeth, heart, or tumor problems. Ferrets are guaranteed for 30 days against illness and 3 months against adrenal tumors.
      </p>
      <div class="mx-auto">testing</div>
    </div>
    """
  end
end
