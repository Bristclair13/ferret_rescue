defmodule FerretRescueWeb.Live.Adopt do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Schemas.Application

  def mount(_params, _session, socket) do
    changeset = Application.changeset(%{})
    {:ok, assign(socket, changeset: changeset)}
  end

  def render(assigns) do
    ~H"""
    <div class="text-3xl max-w-6xl mx-auto">Apply For Adoption</div>
    <div class="mt-2 shadow-lg bg-white max-w-6xl mx-auto p-6">
      <p class="font-semibold mb-6">Adoptions are done by appoitment only</p>
      <p class="mb-6">
        Thank you for your interest in adopting from the Texas Ferret Lover’s Rescue. By filling out this application you are not committing to adopt a pet, but you are supplying the information that Texas Ferret Lover’s Rescue needs to evaluate you as a prospective adopter. You will be contacted by one of our volunteers by email. Please be sure to check your spam/junk folder.
      </p>
      <p>
        Applications are NOT ferret specific. We cannot guarantee availability of ferrets that are on our website.
      </p>
      <p class="mb-6">
        We are a volunteer organization. Your application should only take a few days to process but may take several days depending on how quickly your references return our calls and on the volunteer's schedules. If you have any questions or wish to check on the status of your application please email <span><a
            href="mailto:txflrapplications@gmail.com"
            class="hover:underline text-blue-400 hover:text-blue-500"
          >
          txflrapplications@gmail.com
          </a></span>.
      </p>
      <p class="mb-6">
        <span class="font-semibold">We do not adopt to anyone less than 18 years of age.</span>
        If you are less than 18, a parent must fill out this form and be the responsible party.
      </p>
      <h3 class="text-3xl mb-2">Personal Information</h3>
      <.form :let={f} for={@changeset} phx-submit="submit_application">
        <div class="space-y-5">
          <.input field={f[:name]} label="Full Name" />
          <.input field={f[:age]} label="Age" />
          <.input field={f[:street]} label="Home Address" />
          <.input field={f[:city]} label="City" />
          <.input field={f[:state]} label="State" />
          <.input field={f[:zip_code]} label="Zip Code" />
          <.input field={f[:time_at_address]} label="How long at this address?" />
          <.input field={f[:phone_primary]} label="Primary Phone" />
          <.input field={f[:phone_secondary]} label="Secondary Phone (optional)" />
          <.input field={f[:email]} label="Email" />
          <.input
            field={f[:people_at_address]}
            type="textarea"
            label="How many people live at this house (or visit frequently such as grandchildren/stepchildren) and what are their ages?"
          />
          <.input
            field={f[:home_type]}
            type="select"
            label="What type of home is this?"
            options={[
              {"Please select an option", nil},
              {"House", "house"},
              {"Apartment", "apartment"},
              {"Trailer", "trailer"},
              {"Other (explain in notes)", "other"}
            ]}
          />
          <.input
            field={f[:own_home]}
            type="select"
            label="Do you own this home?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />
          <.input
            field={f[:smoker]}
            type="select"
            label="Is this a smoker's home?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />

          <.input
            field={f[:legal_to_own]}
            type="select"
            label="Are ferrets legal where you live?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />
          <.input
            field={f[:owned_before]}
            type="select"
            label="Have you owned ferrets before?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />
          <.input
            field={f[:other_animals]}
            label="What animals/pets do you currently own?"
            type="textarea"
          />
          <.input
            field={f[:vaccines_current]}
            type="select"
            label="Are these pets current on their vaccinations?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />

          <.input
            field={f[:vet_info]}
            label="Please provide your veterinarian's name and address?"
            type="textarea"
          />
          <.input
            field={f[:surrendered]}
            type="select"
            label="Have you ever surrendered a pet to a shelter?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />

          <h3 class="text-2xl">How much do you know about ferrets?</h3>
          <.input
            field={f[:eat_info]}
            label="What should a ferret eat and drink? How often? What treats are OK and not OK?"
            type="textarea"
          />

          <.input
            field={f[:kept_info]}
            label="Where should a ferret be kept and why? In the house? Garage? Backyard?"
            type="textarea"
          />
          <.input
            field={f[:proofing_info]}
            label="What is ferret proofing and how do you do it?"
            type="textarea"
          />
          <.input
            field={f[:num_ferrets_info]}
            label="What is a good number of ferrets to have and why?"
            type="textarea"
          />
          <.input field={f[:cage_info]} label="When should a ferret be in a cage?" type="textarea" />
          <.input
            field={f[:play_info]}
            label="How often should a ferret be allowed out of his cage? Where should he play and with whom?"
            type="textarea"
          />
          <.input
            field={f[:toy_info]}
            label="What should a ferret be allowed to play with? Give examples of right toys and wrong toys?"
            type="textarea"
          />
          <.input
            field={f[:diseases_info]}
            label="What diseases do ferrets get and what is the treatment?"
            type="textarea"
          />
          <.input
            field={f[:heartworms]}
            type="select"
            label="Can ferrets get heartworms?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />
          <.input
            field={f[:heartworm_treat]}
            type="select"
            label="Is there a treatment to get rid of heartworms in ferrets?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />

          <.input
            field={f[:heartworm_prevent]}
            label="How do you prevent heartworms in ferrets?"
            type="textarea"
          />
          <.input
            field={f[:move_info]}
            label="Under what conditions would you move to a place which would not accept ferrets? What would you do with yours?"
            type="textarea"
          />
          <.input
            field={f[:forever_home]}
            label="What does FOREVER HOME mean to you?"
            type="textarea"
          />
          <.input
            field={f[:notes]}
            label="Notes, aynthing else you think we need to know, or questions you may have for us:"
            type="textarea"
          />
          <.input
            field={f[:fostering]}
            type="select"
            label="Are you interested in fostering ferrets?"
            options={[
              {"Please select an option", nil},
              {"Yes", "true"},
              {"No", "false"}
            ]}
          />
        </div>
        <div class="flex mt-6">
          <input type="checkbox" id="confiming" name="confirming" value="confirming" class="mr-1" />
          <legend>
            By selecting this box and clicking the submit button below I am confirming that I understand ferrets are not caged animals, they are not like hamsters and mice, that they must have time out of a cage daily for their well being both physically and mentally and that they do need human interaction with their play. I am ready to commit to giving the proper time and care to the ferret and I realize they depend completely on my schedule to determine when they will play, sleep and eat. Furthermore, I submit that my answers to the questions above are truthful and accurate to the best of my ability.
          </legend>
        </div>
        <.button class="mt-4">
          Submit
        </.button>
      </.form>
    </div>
    """
  end

  def handle_event("submit_application", %{"application" => params}, socket) do
    case FerretRescue.submit_application(params) do
      {:ok, _application} ->
        socket
        |> push_navigate(to: ~p"/")
        |> put_flash(:info, "You sucessfully submitted your application!")
        |> noreply()

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
