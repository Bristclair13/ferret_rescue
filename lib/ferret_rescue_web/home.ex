defmodule FerretRescueWeb.Live.Home do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="h-full bg-[url('/images/tree_bark.png')]  bg-repeat">
      <div class="flex items-center border-4 border-black bg-white max-w-6xl mx-auto">
        <div>
          <img src="/images/logo.jpg" class="h-32 pl-4" />
        </div>
        <div class="flex flex-col mx-auto">
          <p class="text-center text-4xl pt-8 pb-8">Texas Ferret Lover's Rescue</p>
          <p class="text-center">
            Our Mission: We're saving lives, as many as we can. Finding forever homes for our theiving friends.
          </p>
          <button class="place-content-center">Adopt A Ferret!</button>
        </div>
        <div>
          <img src="/images/logo.jpg" class="h-32 pr-4" />
        </div>
      </div>
      <div class="flex justify-between  max-w-6xl mx-auto h-32 box-shadow-md mt-6">
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
