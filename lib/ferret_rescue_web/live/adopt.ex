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
            field={@form[:family_visiting]}
            type="textarea"
            label="How many people live at this house (or visit frequently such as grandchildren/stepchildren) and what are their ages?"
          />
          <div class="flex flex-col">
            <label for="home-select" class="mb-4">What type of home is this?</label>

            <select name="types-of-homes" id="home-select">
              <option value="">--Please choose an option--</option>
              <option value="house">House</option>
              <option value="apartment">Apartment</option>
              <option value="trailer">Trailer</option>
              <option value="other">Other (explain in notes)</option>
            </select>
          </div>
          <div class="flex flex-col">
            <label for="own-home" class="mb-4">Do you own this home?</label>

            <select name="own-home" id="own-home">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <div class="flex flex-col">
            <label for="smokers-home" class="mb-4">Is this a smoker's home?</label>

            <select name="smokers-home" id="smokers-home">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <div class="flex flex-col">
            <label for="ferrets-legal" class="mb-4">Are ferrets legal where you live?</label>

            <select name="legal" id="ferrets-legal">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <div class="flex flex-col">
            <label for="owned-ferrets" class="mb-4">Have you owned ferrets before?</label>

            <select name="owned-ferrets" id="owned-ferrets">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <.input
            field={@form[:animals_currently_owned]}
            label="What animals/pets do you currently own?"
            type="textarea"
          />
          <div class="flex flex-col">
            <label for="current-on-vaccines" class="mb-4">
              Are these pets current on their vaccinations?
            </label>

            <select name="current-on-vaccines" id="current-on-vaccines">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <.input
            field={@form[:vet_name_and_address]}
            label="Please provide your veterinarian's name and address?"
            type="textarea"
          />
          <div class="flex flex-col">
            <label for="surrender-pet" class="mb-4">
              Have you ever surrendered a pet to a shelter?
            </label>

            <select name="surrender-pet" id="surrender-pet">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <h3 class="text-2xl">How much do you know about ferrets?</h3>
          <.input
            field={@form[:food_and_drink_question]}
            label="What should a ferret eat and drink? How often? What treats are OK and not OK?"
            type="textarea"
          />

          <.input
            field={@form[:where_should_be_kept_question]}
            label="Where should a ferret be kept and why? In the house? Garage? Backyard?"
            type="textarea"
          />
          <.input
            field={@form[:ferret_proofing_question]}
            label="What is ferret proofing and how do you do it?"
            type="textarea"
          />
          <.input
            field={@form[:number_of_ferrets_question]}
            label="What is a good number of ferrets to have and why?"
            type="textarea"
          />
          <.input
            field={@form[:when_should_be_caged_question]}
            label="When should a ferret be in a cage?"
            type="textarea"
          />
          <.input
            field={@form[:how_often_out_of_cage_question]}
            label="How often should a ferret be allowed out of his cage? Where should he play and with whom?"
            type="textarea"
          />
          <.input
            field={@form[:allowed_to_play_with_what_question]}
            label="What should a ferret be allowed to play with? Give examples of right toys and wrong toys?"
            type="textarea"
          />
          <.input
            field={@form[:common_dieaseases_question]}
            label="What diseases do ferrets get and what is the treatment?"
            type="textarea"
          />
          <div class="flex flex-col">
            <label for="ferret-heartworm" class="mb-4">
              Can ferrets get heartworms?
            </label>

            <select name="ferret-heartworm" id="ferret-heartworm">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <div class="flex flex-col">
            <label for="heartworm-treatable" class="mb-4">
              Is there a treatment to get rid of heartworms in ferrets?
            </label>

            <select name="heartworm-treatable" id="heartworm-treatable">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <.input
            field={@form[:how_to_prevent_heaertworms]}
            label="How do you prevent heartworms in ferrets?"
            type="textarea"
          />
          <.input
            field={@form[:changed_circumstances_question]}
            label="Under what conditions would you move to a place which would not accept ferrets? What would you do with yours?"
            type="textarea"
          />
          <.input
            field={@form[:forever_home_meaning]}
            label="What does FOREVER HOME mean to you?"
            type="textarea"
          />
          <.input
            field={@form[:notes_and_questions]}
            label="Notes, aynthing else you think we need to know, or questions you may have for us:"
            type="textarea"
          />
          <div class="flex flex-col">
            <label for="interested-in-fostering" class="mb-4">
              Are you interested in fostering ferrets?
            </label>

            <select name="interested-in-fostering" id="interested-in-fostering">
              <option value="">--Please choose an option--</option>
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>
          <div class="flex mt-6">
            <input type="checkbox" id="confiming" name="confirming" value="confirming" class="mr-1" />
            <legend>
              By selecting this box and clicking the submit button below I am confirming that I understand ferrets are not caged animals, they are not like hamsters and mice, that they must have time out of a cage daily for their well being both physically and mentally and that they do need human interaction with their play. I am ready to commit to giving the proper time and care to the ferret and I realize they depend completely on my schedule to determine when they will play, sleep and eat. Furthermore, I submit that my answers to the questions above are truthful and accurate to the best of my ability.
            </legend>
          </div>
        </.simple_form>
      </div>
    </div>
    """
  end
end
