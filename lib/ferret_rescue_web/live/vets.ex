defmodule FerretRescueWeb.Live.Vets do
  use FerretRescueWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col max-w-6xl mx-auto">
      <div class="text-3xl mx-auto">Emergency Animal Clinic</div>
      <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
        <div class="flex justify-between">
          <a
            href="https://veterinaryemergencygroup.com/locations/dallas-tx/"
            class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
            target="_blank"
          >
            Veterinary Emergency Group
          </a>
          <a href="tel:+19725447311" class="hover:underline text-blue-400 hover:text-blue-500">
            (972) 544-7311
          </a>
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
            <a
              href="https://www.bossieranimalhospital.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Bossier Animal Hospital - Bossier City
            </a>
            <a href="tel:+13187467829" class="hover:underline text-blue-400 hover:text-blue-500">
              (318) 746-7821
            </a>
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
            <a href="tel:+13184254860" class="hover:underline text-blue-400 hover:text-blue-500">
              (318) 425-4860
            </a>
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
            <a href="tel:+19724726880" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 472-6880
            </a>
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
            <a href="tel:+19722222191" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 222-2101
            </a>
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
            <a
              href="https://flintvetclinic.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Flint Veterinary Clinic - Flint
            </a>
            <a href="tel:+19038947278" class="hover:underline text-blue-400 hover:text-blue-500">
              (903) 894-7278
            </a>
          </div>
          <div class="mt-3">
            <p>18421 FM 2493</p>
            <p class="mt-3">Flint, TX 75762</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <a
              href="https://www.griffithanimalhospital.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Griffith Small Animal Hospital - Austin
            </a>
            <a href="tel:+15124535828" class="hover:underline text-blue-400 hover:text-blue-500">
              (512) 453-5828
            </a>
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
            <a
              href="https://vcahospitals.com/lakeside-tx"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Lakeside Veterinary Clinic - Ft Worth
            </a>
            <a href="tel:+18172371267" class="hover:underline text-blue-400 hover:text-blue-500">
              (817) 237-1267
            </a>
          </div>
          <div class="mt-3">
            <p>7817 Jacksboro Hwy.</p>
            <p class="mt-3">Ft. Worth, TX 76135</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <p class="text-xl">Parker Animal & Bird Clinic - Plano</p>
            <a href="tel:+19729850036" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 985-0036
            </a>
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
            <a
              href="https://www.plantationpethealthcenter.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Plantation Pet Health Center - Frisco
            </a>
            <a href="tel:+19727310001" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 731-0001
            </a>
          </div>
          <div class="mt-3">
            <p>George E. Martin Jr., DVM</p>
            <p>12560 Lebanon Road</p>
            <p class="mt-3">Frisco, TX 75035</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <a
              href="https://schraganimalclinic.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Schrag Animal Clinic - Oklahoma City, Ok
            </a>
            <a href="tel:+14056810829" class="hover:underline text-blue-400 hover:text-blue-500">
              (405) 681-0829
            </a>
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
            <a
              href="https://southlakevet.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Southlake Animal Hospital - Southlake
            </a>
            <a href="tel:+18174812014" class="hover:underline text-blue-400 hover:text-blue-500">
              (817) 481-2014
            </a>
          </div>
          <div class="mt-3">
            <p>Greg Moore & Toni Cloninger, DVMs</p>
            <p>200 West State Highway 114</p>
            <p class="mt-3">Southlake, TX 76135</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <a
              href="https://www.animalclinicoffarmersbranch.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Valwood Animal Hospital - Dallas
            </a>
            <a href="tel:+19726354371" class="hover:underline text-blue-400 hover:text-blue-500">
              (972) 635-4371
            </a>
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
            <a
              href="https://veterinaryemergencygroup.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Veterinary Emergency Group - Dallas
            </a>
            <a href="tel:+19725447311" class="hover:underline text-blue-400 hover:text-blue-500">
              (972)-544-7311
            </a>
          </div>
          <div class="mt-3">
            <p>4500 N Central Expressway</p>
            <p class="mt-3">Dallas, Texas 75206</p>
          </div>
        </div>
        <div class="flex flex-col w-1/2 mx-auto mt-6 p-6 bg-white shadow-lg">
          <div class="flex justify-between">
            <a
              href="http://vickeryplaceanimalhospital.com"
              class="hover:underline text-blue-400 hover:text-blue-500 text-xl"
              target="_blank"
            >
              Vickery Place Animal Hospital - Dallas
            </a>
            <a href="tel:+12142520800" class="hover:underline text-blue-400 hover:text-blue-500">
              (214) 252-0800
            </a>
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
