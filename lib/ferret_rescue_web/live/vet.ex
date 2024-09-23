defmodule FerretRescueWeb.Live.Vet do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-6xl mx-auto">
      <div class="text-3xl mx-auto">Emergency Animal Clinic</div>
      <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
        <div class="flex justify-between">
          <p class="text-2xl">Veterinary Emergency Group</p>
          <p>(972) 544-7311</p>
        </div>
        <div class="mt-3">
          <p>4500 North Central Expwy</p>
          <p>Dallas, TX 75206</p>
          <p class="mt-3">Open 24/7</p>
        </div>
      </div>
      <h3 class="mt-6 text-center text-3xl">Ferret Specialists</h3>
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Bossier Animal Hospital - Bossier City</p>
            <p>(318) 746-7829</p>
          </div>
          <div class="mt-3">
            <p>Dr. Larry Snyder</p>
            <p>3308 Industrial Drive</p>
            <p class="mt-3">Bossier City, LA 71112</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Brookings Animal Hospital - Shreveport La</p>
            <p>(318) 425-4860</p>
          </div>
          <div class="mt-3">
            <p>Dr. Brookings</p>
            <p>4919 N Market St</p>
            <p class="mt-3">Shreveport, LA 71107</p>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
