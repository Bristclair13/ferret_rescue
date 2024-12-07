defmodule FerretRescueWeb.Live.Home do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex items-center shadow-lg drop-shadow-lg bg-white max-w-6xl mx-auto h-52">
      <div>
        <img src="/images/logo.jpg" class="h-36 ml-10" />
      </div>
      <div class="flex flex-col mx-auto">
        <p class="text-center text-4xl pb-2">Texas Ferret Lover's Rescue</p>
        <p class="text-center">
          Our Mission: We're saving lives, as many as we can. Finding forever homes for our theiving friends.
        </p>
        <.link
          navigate={~p"/adopt"}
          class="mx-auto mt-8 w-32 p-2 bg-emerald-600 hover:bg-emerald-700 rounded-md text-white"
        >
          Adopt a Ferret!
        </.link>
      </div>
      <div>
        <img src="/images/logo.jpg" class="h-36 mr-10" />
      </div>
    </div>
    <div class="flex justify-between max-w-6xl mx-auto h-44 mt-6">
      <img src="/images/ferret-1.jpg" class="w-44" />
      <img src="/images/ferret-2.jpg" class="w-44" />
      <img src="/images/ferret-3.jpg" class="w-44" />
      <img src="/images/ferret-4.jpg" class="w-44" />
      <img src="/images/ferret-5.jpg" class="w-44" />
      <img src="/images/ferret-6.jpg" class="w-44" />
    </div>
    <div class="flex max-w-6xl justify-between mx-auto mt-6 mb-6">
      <.link
        navigate={~p"/adopt"}
        class="w-96 h=[89px] text-3xl text-center my-4 pt-6 bg-emerald-200 hover:bg-emerald-300"
      >
        Apply to Adopt
      </.link>
      <div class=" bg-white h-32">
        <div class="flex px-6">
          <div class="flex flex-col pt-6">
            <p class="text-center">$</p>
            <form>
              <input id="donate" type="text" placeholder="amount" />
              <label for="donate"></label>
            </form>
          </div>
          <div>
            <button class="ml-2 mt-12 p-2 bg-emerald-600 hover:bg-emerald-700 rounded-md text-white">
              Donate
            </button>
          </div>
        </div>
      </div>
      <div>
        <button class="w-96 h=[89px] px-24 py-7 my-4 text-3xl bg-emerald-200 hover:bg-emerald-300">
          Contact Us
        </button>
      </div>
    </div>
    <div class="flex max-w-6xl mx-auto justify-between">
      <div class="flex flex-col shadow-lg drop-shadow-lg p-4 bg-white w-96">
        <h2 class="text-3xl pb-4">About Us</h2>
        <p>
          We are a rescue group that takes in homeless, abandoned, and needy ferrets. We evaluate them, get them current on shots, and any medical treatment they may need before finding them a forever home. We are not a business, but a volunteer organization.
        </p>
      </div>
      <div class="flex flex-col shadow-lg drop-shadow-lg p-4 bg-white w-[350px]">
        <h2 class="text-3xl pb-4">Foster Program</h2>
        <p>
          Some of the ferrets that are surrendered to us are either too old or have illnesses that make them "undesirable" to others. Since we are a <span class="font-bold">NO KILL SHELTER</span>, we place these ferrets in a safe, loving, forever foster home to live out the rest of their lives as comfortably as we can make it. To learn more about sponsoring or fostering these ferrets please click the button below.
        </p>
      </div>
      <div class="flex flex-col shadow-lg drop-shadow-lg p-4 bg-white w-96">
        <h2 class="text-3xl pb-4">Surrender</h2>
        <p>
          If you need to surrender your ferret, please call
          <span>
            <a href="tel:+19722865778" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 286-5778
            </a>
          </span>
          to schedule an appointment. We ask for a $25 donation/ferret to help cover medical expenses, such as rabies, distemper and microchipping.
        </p>
      </div>
    </div>
    <div class="flex justify-between max-w-6xl mx-auto pt-6">
      <div class="flex flex-col justify-between shadow-lg drop-shadow-lg w-1/2 bg-white">
        <div>
          <h3 class="text-center text-2xl">We are proud members of the following organizations</h3>
        </div>
        <div class="flex mx-auto">
          <img src="/images/tasc-logo.jpg" class="w-32 h-36" />
          <img src="/images/sos-logo.gif" class="w-40 h-36" />
          <img src="/images/afa-logo.jpg" class="w-36 h-36" />
        </div>
        <div class="flex mx-auto">
          <img src="/images/bissell-logo.jpg" class="w-48 h-36" />
          <img src="/images/lost-pet-logo.jpg" class="w-72 h-36" />
        </div>
      </div>
      <div class="flex flex-col w-1/2">
        <img src="/images/amazon-smile.png" class="pl-4" />
        <div class="shadow-lg drop-shadow-lg ml-4 mt-6 bg-white py-6">
          <p class="text-center text-2xl">We are distributors for the following food brand</p>
          <img src="/images/tf-logo.jpg" class="w-36 h-24 mx-auto" />
        </div>
      </div>
    </div>
    <div class="m-6 aspect-video">
      <iframe
        class="embed-responsive-item w-[1110px] h-[624px] mx-auto"
        src="https://www.youtube.com/embed/SDsC9CF1jXI"
        title="SDsC9CF1jXI"
        allowfullscreen=""
      >
      </iframe>
    </div>
    """
  end
end
