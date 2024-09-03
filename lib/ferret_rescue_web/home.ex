defmodule FerretRescueWeb.Live.Home do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class=" h-full bg-[url('/images/tree_bark.png')]  bg-repeat">
      <div>
        <p class="text-center pt-8 pb-8">Texas Ferret Lover's Rescue</p>
        <p class="text-center">
          Our Mission: We're saving lives, as many as we can. Finding forever homes for our theiving friends.
        </p>
        <button class="place-content-center">Adopt A Ferret!</button>
      </div>
      <div class="flex justify-between  max-w-6xl mx-auto h-32">
        <img src="/images/ferret-1.jpg" />
        <img src="/images/ferret-2.jpg" />
        <img src="/images/ferret-3.jpg" />
        <img src="/images/ferret-4.jpg" />
        <img src="/images/ferret-5.jpg" />
        <img src="/images/ferret-6.jpg" />
      </div>
    </div>
    """
  end
end
