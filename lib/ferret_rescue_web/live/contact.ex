defmodule FerretRescueWeb.Live.Contact do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-[1110px] bg-white text-center mx-auto shadow-lg drop-shadow-lg">
      <div class="flex flex-col my-6">
        <h3 class="text-2xl mb-2">You may write to us at the following address:</h3>
        <p>Texas Ferret Lover's Rescue</p>
        <p>P.O. Box 171</p>
        <p>Fate, TX 75132</p>
      </div>
      <div class="flex flex-col mb-6">
        <h3 class="text-2xl mb-2">You can also email us at:</h3>
        <p>txflroffice@gmail.com</p>
      </div>
      <div class="mb-6">
        <h3 class="text-2xl mb-2">Or you can call us between 9AM and 7PM</h3>
        <a href="tel:+19722865778" class="hover:underline text-blue-400">(972) 286-5778</a>
      </div>
      <div class="mb-8">
        <p>
          The rescue is not a business and operates out of a private home. We ask that you please respect that.
        </p>
      </div>
    </div>
    """
  end
end
