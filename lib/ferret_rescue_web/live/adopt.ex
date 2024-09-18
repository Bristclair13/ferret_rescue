defmodule FerretRescueWeb.Live.Adopt do
  use FerretRescueWeb, :live_view

  def mount(_params, session, socket) do
    user = session["current_user"]
    form = to_form(%{"ferret_questions" => ""})
    {:ok, assign(socket, user: user, form: form)}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-[url('/images/tree_bark.png')] bg-repeat p-6">
      <div class="text-3xl">Apply For Adoption</div>
      <div class="mt-2 shadow-lg drop-shadow-lg bg-white w-[1110px] mx-auto p-6">
        <p class="font-bold mb-6">Adoptions are done by appoitment only</p>
        <p class="mb-6">
          Thank you for your interest in adopting from the Texas Ferret Lover’s Rescue. By filling out this application you are not committing to adopt a pet, but you are supplying the information that Texas Ferret Lover’s Rescue needs to evaluate you as a prospective adopter. You will be contacted by one of our volunteers by email. Please be sure to check your spam/junk folder.
        </p>
        <p>
          Applications are NOT ferret specific. We cannot guarantee availability of ferrets that are on our website.
        </p>
        <p class="mb-6">
          We are a volunteer organization. Your application should only take a few days to process but may take several days depending on how quickly your references return our calls and on the volunteer's schedules. If you have any questions or wish to check on the status of your application please email txflrapplications@gmail.com.
        </p>
        <p class="mb-6">
          We do not adopt to anyone less than 18 years of age. If you are less than 18, a parent must fill out this form and be the responsible party.
        </p>
        <h3 class="text-3xl">Personal Information</h3>
        <.simple_form for={@form} phx-submit="ferret_questions">
          <.input field={@form[:full_name]} label="Full Name" />
          <.input field={@form[:age]} label="Age" />
          <.input field={@form[:address]} label="Home Address" />
          <.input field={@form[:city]} label="City" />
          <.input field={@form[:state]} label="State" />
          <.input field={@form[:zip_code]} label="Zip Code" />
          <.input field={@form[:time_at_address]} label="How long at this address?" />
          <.input field={@form[:primary_phone]} label="Primary Phone" />
          <.input field={@form[:secondary_phone]} label="Secondary Phone (optional)" />
          <.input field={@form[:email]} label="Email" />
          <.input
            field={@form[:people_living_at_house]}
            label="How many people live at this house (or visit frequently such as grandchildren/stepchildren) and what are their ages?"
          />
          <.input field={@form[:type_of_home]} label="What type of home is this?" />
        </.simple_form>
      </div>
    </div>
    """
  end
end
