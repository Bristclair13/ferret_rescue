defmodule FerretRescueWeb.Live.Foster do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-[1110px] mx-auto bg-white p-6 shadow-lg drop-shadow-lg">
      <p class="mb-6">
        Most of the ferrets that are surrendered to us are of adoptable age and health. But some are either too old or have illnesses that make them "undesirable" to others. Since we are a NO KILL SHELTER, we place these ferrets in a safe, loving, forever foster home to live out the rest of their lives as comfortably as we can make it.
      </p>
      <p class="mb-6">
        The cost of supporting these ferrets has grown beyond our expectations simply because they are living longer as a result of better care and a greater understanding of the different types of diseases. Please consider sponsoring one (or more) of our fosters to help pay for their medical needs.
      </p>
      <p class="mb-6">
        Fostered ferrets have no adoption fee and we cover their medical bills for life. You will only be responible for providing food, toys, and a forever home.
      </p>
      <p>
        If you have any questions you can contact the rescue at
        <span>
          <a href="tel:+19722865778" class="hover:underline text-blue-400 hover:text-blue-500">
            (972) 286-5778.
          </a>
        </span>
      </p>
    </div>
    """
  end
end
