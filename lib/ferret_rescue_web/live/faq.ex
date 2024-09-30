defmodule FerretRescueWeb.Live.Faq do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="max-w-6xl mx-auto flex flex-col">
      <h3 class="text-3xl">Frequently Asked Questions</h3>
      <div class="mt-2 p-4 shadow-lg bg-white flex flex-col">
        <div>
          <h3 class="text-3xl mb-1">Basic</h3>
          <button
            type="button"
            class="p-3 border rounded bg-gray-50"
            phx-click={toggle("#ferrets-eat")}
          >
            What should ferrets eat?
          </button>
          <p id="ferrets-eat" class="hidden px-4 py-6 border">
            Ferrets are obligate carnivores. They need high protein and fat, no carbs, so they must be fed a good quality ferret food. There are several on the market that are good including: Totally Ferret, Marshal Farms, and Natural Gold. Our rescue sells Totally Ferret Active, Totally Ferret Venison and Wysong. Do not feed ferrets anything that has sugar in it, including raisins, bananas, Yogi's, ect... A good treat would be Turkey or Chicken and Gravy baby food (Delmonte or Gerber's). Also, Foamy Fries are good too and Ferret N-Bone Chew Treat (great for their teeth).
          </p>
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
