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
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Crandall Animal Hospital - Crandall</p>
            <p>(972) 472-6880</p>
          </div>
          <div class="mt-3">
            <p>T.R. Tunnell DVM</p>
            <p>607 North Main Street</p>
            <p class="mt-3">Crandall, TX 75114</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Dallas County Veterinary Hospital - Mesquite</p>
            <p>(972) 222-2101</p>
          </div>
          <div class="mt-3">
            <p>Kevin Shurtleff, DVM</p>
            <p>3475 S. Belt Line</p>
            <p class="mt-3">Mesquite, TX 75181</p>
          </div>
        </div>
      </div>
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Flint Veterinary Clinic - Flint</p>
            <p>(903) 894-7278</p>
          </div>
          <div class="mt-3">
            <p>18421 FM 2493</p>
            <p class="mt-3">Flint, TX 75762</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Griffith Small Animal Hospital - Austin</p>
            <p>(512) 453-5828</p>
          </div>
          <div class="mt-3">
            <p>Dr. Lynne Boggs</p>
            <p>3407 Northland Dr.</p>
            <p class="mt-3">Austin, TX 78731</p>
          </div>
        </div>
      </div>
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Lakeside Veterinary Clinic - Ft Worth</p>
            <p>(817) 237-1267</p>
          </div>
          <div class="mt-3">
            <p>7817 Jacksboro Hwy.</p>
            <p class="mt-3">Ft. Worth, TX 76135</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Parker Animal & Bird Clinic - Plano</p>
            <p>(972) 985-0036</p>
          </div>
          <div class="mt-3">
            <p>Charles C. Blonien, DVM</p>
            <p>2129 W. Parker Road, Suite A.</p>
            <p class="mt-3">Plano, TX 75023</p>
          </div>
        </div>
      </div>
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Plantation Pet Health Center - Frisco</p>
            <p>(972) 731-0001</p>
          </div>
          <div class="mt-3">
            <p>George E. Martin Jr., DVM</p>
            <p>12560 Lebanon Road</p>
            <p class="mt-3">Frisco, TX 75035</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Schrag Animal Clinic - Oklahoma City, Ok</p>
            <p>(405) 681-0829</p>
          </div>
          <div class="mt-3">
            <p>Sue Schrag, DVM</p>
            <p>8000 S. Pennsylvania Ave</p>
            <p class="mt-3">Oklahoma City, OK 72159</p>
          </div>
        </div>
      </div>
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Southlake Animal Hospital - Southlake</p>
            <p>(817) 481-2014</p>
          </div>
          <div class="mt-3">
            <p>Greg Moore & Toni Cloninger, DVMs</p>
            <p>200 West State Highway 114</p>
            <p class="mt-3">Southlake, TX 76135</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Valwood Animal Hospital - Dallas</p>
            <p>(972) 635-4371</p>
          </div>
          <div class="mt-3">
            <p>Jerry Murray, DVM</p>
            <p>14067 Dennis Ln</p>
            <p class="mt-3">Dallas, TX 75234</p>
          </div>
        </div>
      </div>
      <div class="flex">
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg mr-6">
          <div class="flex justify-between">
            <p class="text-xl">Veterinary Emergency Group - Dallas</p>
            <p>972-544-7311</p>
          </div>
          <div class="mt-3">
            <p>4500 N Central Expressway</p>
            <p class="mt-3">Dallas, Texas 75206</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Vickery Place Animal Hospital - Dallas</p>
            <p>(214) 252-0800</p>
          </div>
          <div class="mt-3">
            <p>Dr. Martin, DVM</p>
            <p>2720 N Henderson</p>
            <p class="mt-3">Dallas, TX 75206</p>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
