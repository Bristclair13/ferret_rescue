defmodule FerretRescueWeb.Live.Home do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="h-full bg-[url('/images/tree_bark.png')]  bg-repeat p-6">
      <div class="flex items-center shadow-lg drop-shadow-lg bg-white max-w-6xl mx-auto h-52">
        <div>
          <img src="/images/logo.jpg" class="h-36 pl-4" />
        </div>
        <div class="flex flex-col mx-auto">
          <p class="text-center text-4xl pb-2">Texas Ferret Lover's Rescue</p>
          <p class="text-center">
            Our Mission: We're saving lives, as many as we can. Finding forever homes for our theiving friends.
          </p>
          <button class="mx-auto mt-8 w-32 p-2 bg-green-600 hover:bg-green-700 rounded-md text-white">
            Adopt A Ferret!
          </button>
        </div>
        <div>
          <img src="/images/logo.jpg" class="h-36 pr-4" />
        </div>
      </div>
      <div class="flex justify-between  max-w-6xl mx-auto h-40 mt-6">
        <img src="/images/ferret-1.jpg" />
        <img src="/images/ferret-2.jpg" />
        <img src="/images/ferret-3.jpg" />
        <img src="/images/ferret-4.jpg" />
        <img src="/images/ferret-5.jpg" />
        <img src="/images/ferret-6.jpg" />
      </div>
      <div class="flex max-w-6xl justify-between mx-auto  mt-6">
        <div>
          <button class="px-24 py-6 text-3xl mt-4 w-fit bg-lime-100 hover:bg-green-600">
            Apply to Adopt
          </button>
        </div>
        <div class=" bg-white h-32 w-fit">
          <div class="flex">
            <div class="flex flex-col">
              <p>$</p>
              <form>
                <input id="donate" type="text" placeholder="amount" />
                <label for="donate"></label>
              </form>
            </div>
            <div>
              <button class="w-24 py-0.5 px-0.5 bg-green-600 hover:bg-green-700 rounded-md text-white">
                Donate
              </button>
            </div>
          </div>
        </div>
        <div>
          <button class="px-24 py-6 mt-4 w-fit text-3xl bg-lime-100 hover:bg-green-600">
            Contact Us
          </button>
        </div>
      </div>
    </div>
    """
  end
end
