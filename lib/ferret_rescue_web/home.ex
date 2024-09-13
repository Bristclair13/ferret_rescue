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
      <div class="flex justify-between max-w-6xl mx-auto h-40 mt-6">
        <img src="/images/ferret-1.jpg" class="w-40" />
        <img src="/images/ferret-2.jpg" class="w-40" />
        <img src="/images/ferret-3.jpg" class="w-40" />
        <img src="/images/ferret-4.jpg" class="w-40" />
        <img src="/images/ferret-5.jpg" class="w-40" />
        <img src="/images/ferret-6.jpg" class="w-40" />
      </div>
      <div class="flex max-w-6xl justify-between mx-auto mt-6 mb-6">
        <div>
          <button class="px-24 py-6 text-3xl mt-4 bg-lime-100 hover:bg-green-600">
            Apply to Adopt
          </button>
        </div>
        <div class=" bg-white h-32">
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
          <button class="px-24 py-6 mt-4 text-3xl bg-lime-100 hover:bg-green-600">
            Contact Us
          </button>
        </div>
      </div>
      <div class="flex max-w-6xl mx-auto">
        <div class="flex flex-col border-2 border-black p-4 mr-6 bg-white">
          <h2>About Us</h2>
          <p>
            We are a rescue group that takes in homeless, abandoned, and needy ferrets. We evaluate them, get them current on shots, and any medical treatment they may need before finding them a forever home. We are not a business, but a volunteer organization.
          </p>
        </div>
        <div class="flex flex-col border-2 border-black p-4 mr-6 bg-white">
          <h2>Foster Program</h2>
          <p>
            Some of the ferrets that are surrendered to us are either too old or have illnesses that make them "undesirable" to others. Since we are a NO KILL SHELTER, we place these ferrets in a safe, loving, forever foster home to live out the rest of their lives as comfortably as we can make it. To learn more about sponsoring or fostering these ferrets please click the button below.
          </p>
        </div>
        <div class="flex flex-col border-2 border-black p-4 bg-white">
          <h2>Surrender</h2>
          <p>
            If you need to surrender your ferret, please call (972) 286-5778 to schedule an appointment. We ask for a $25 donation/ferret to help cover medical expenses, such as rabies, distemper and microchipping.
          </p>
        </div>
      </div>
      <div class="flex justify-between max-w-6xl mx-auto pt-6">
        <div class="flex flex-col border-2 border-black w-1/2 ">
          <div>
            <h3>We are proud members of the following organizations</h3>
          </div>
          <div class="flex">
            <img src="/images/tasc-logo.jpg" class="w-32 h-36" />
            <img src="/images/sos-logo.gif" class="w-40 h-36" />
            <img src="/images/afa-logo.jpg" class="w-36 h-36" />
          </div>
          <div class="flex">
            <img src="/images/bissel-logo.jpg" class="w-48 h-36" />
            <img src="/images/lost-pet-logo.jpg" class="w-72 h-36" />
          </div>
        </div>
        <div class="flex flex-col w-1/2">
          <img src="/images/amazon-smile.png" />
          <div>
            <p>We are distributors for the following food brand</p>
            <img src="/images/tf-logo.jpg" />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
