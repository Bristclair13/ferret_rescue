defmodule FerretRescueWeb.Live.Application do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Schemas.Message

  def mount(params, _session, socket) do
    application_id = params["id"]
    changeset = Message.changeset(%{})
    messages = FerretRescue.list_messages(application_id)

    {:ok, application} = FerretRescue.get_application_by(id: application_id)
    {:ok, assign(socket, application: application, changeset: changeset, messages: messages)}
  end

  def render(assigns) do
    ~H"""
    <div class="bg-white pb-4">
      <div class="max-w-7xl mx-auto">
        <div class="text-2xl pt-6"><%= @application.name %></div>

        <div class="flex gap-x-3 mt-6">
          <.link
            href={~p"/admin"}
            class="text-white bg-blue-500 hover:bg-blue-600 rounded-lg my-auto p-1"
          >
            Go Back
          </.link>
          <.button
            phx-click="approve"
            class="text-white bg-green-500 hover:bg-green-600 rounded-lg my-auto p-1"
          >
            Approve
          </.button>
          <.button
            phx-click="decline"
            class="text-white bg-red-500 hover:bg-red-600 rounded-lg my-auto p-1"
          >
            Decline
          </.button>
        </div>

        <div class="flex flex-col mt-6">
          <h2 class="font-medium text-lg">Status</h2>
          <p>Approved: <%= if @application.approved, do: "yes", else: "no" %></p>
          <div class="flex items-center">
            <p class="mr-2">Reviewed:</p>
            <div class="flex h-6 shrink-0 items-center">
              <div class="group grid size-4 grid-cols-1">
                <input
                  disabled={@application.reviewed == false}
                  id="person-5"
                  name="person-5"
                  type="checkbox"
                  class="col-start-1 row-start-1 appearance-none rounded border border-gray-300 bg-white checked:border-green-500 checked:bg-green-500 indeterminate:border-green-500 indeterminate:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-bg-green-500 disabled:border-gray-300 disabled:bg-gray-100 disabled:checked:bg-gray-100 forced-colors:appearance-auto"
                />
                <svg
                  class="pointer-events-none col-start-1 row-start-1 size-3.5 self-center justify-self-center stroke-white group-has-[:disabled]:stroke-gray-950/25"
                  viewBox="0 0 14 14"
                  fill="none"
                >
                  <path
                    class="opacity-0 group-has-[:checked]:opacity-100"
                    d="M3 8L6 11L11 3.5"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <path
                    class="opacity-0 group-has-[:indeterminate]:opacity-100"
                    d="M3 7H11"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>
              </div>
            </div>
          </div>
          <div class="flex items-center">
            <p class="mr-2">Final:</p>
            <div class="flex h-6 shrink-0 items-center">
              <div class="group grid size-4 grid-cols-1">
                <input
                  disabled={@application.final == false}
                  id="person-5"
                  name="person-5"
                  type="checkbox"
                  class="col-start-1 row-start-1 appearance-none rounded border border-gray-300 bg-white checked:border-green-500 checked:bg-green-500 indeterminate:border-green-500 indeterminate:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-bg-green-500 disabled:border-gray-300 disabled:bg-gray-100 disabled:checked:bg-gray-100 forced-colors:appearance-auto"
                />
                <svg
                  class="pointer-events-none col-start-1 row-start-1 size-3.5 self-center justify-self-center stroke-white group-has-[:disabled]:stroke-gray-950/25"
                  viewBox="0 0 14 14"
                  fill="none"
                >
                  <path
                    class="opacity-0 group-has-[:checked]:opacity-100"
                    d="M3 8L6 11L11 3.5"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <path
                    class="opacity-0 group-has-[:indeterminate]:opacity-100"
                    d="M3 7H11"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>
              </div>
            </div>
          </div>
        </div>
        <h2 class="font-medium text-lg">Messages</h2>

        <.form :let={f} for={@changeset} phx-submit="send_message">
          <.input field={f[:message]} type="textarea" label="send message to applicant" />
          <.button class="mt-4 px-2 py-1 text-white bg-green-500 hover:bg-green-600 rounded-md">
            Send
          </.button>
        </.form>
      </div>
      <div class="flex flex-col max-w-7xl mx-auto mt-6">
        <p>Message history</p>
        <table>
          <thead>
            <tr>
              <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">Sent at</th>
              <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Message</th>
            </tr>
          </thead>
          <tbody :for={message <- @messages}>
            <tr>
              <td class="border border-neutral-800 bg-white px-24 py-4"><%= message.sent_at %></td>
              <td class="border border-neutral-800 bg-white px-24 py-4"><%= message.message %></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="flex flex-col max-w-7xl mx-auto">
        <p class="text-2xl mt-6">Application</p>
        <table>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">Full Name</td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.name %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">Age</td>
            <td class="border border-neutral-800 bg-white px-12 py-4"><%= @application.age %></td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">Home Address</td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.street %>
            </td>
          </tr>

          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">City</td>
            <td class="border border-neutral-800 bg-white px-12 py-4"><%= @application.city %></td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">State</td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.state %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">Zip Code</td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.zip_code %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              How long at this address?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.time_at_address %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">Primary Phone</td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.phone_primary %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              Secondary Phone (optional)
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.phone_secondary %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">Email</td>
            <td class="border border-neutral-800 bg-white px-12 py-4"><%= @application.email %></td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              How many people live at this house (or visit frequently such as grandchildren/stepchildren) and what are their ages?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.people_at_address %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              What type of home is this?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.home_type %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              Do you own this home?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= if @application.own_home, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Is this a smoker's home?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= if @application.smoker, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              Are ferrets legal where you live?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= if @application.legal_to_own, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Have you owned ferrets before?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4 ">
              <%= if @application.owned_before, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              What animals/pets do you currently own?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.other_animals %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Are these pets current on their vaccinations?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= if @application.vaccines_current, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              Please provide your veterinarian's name and address?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.vet_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Have you ever surrendered a pet to a shelter?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= if @application.surrendered, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              What should a ferret eat and drink? How often? What treats are OK and not OK?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.eat_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Where should a ferret be kept and why? In the house? Garage? Backyard?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.kept_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              What is ferret proofing and how do you do it?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.proofing_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              What is a good number of ferrets to have and why?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.num_ferrets_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              When should a ferret be in a cage?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.cage_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              How often should a ferret be allowed out of his cage? Where should he play and with whom?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.play_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              "What should a ferret be allowed to play with? Give examples of right toys and wrong toys?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.toy_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              What diseases do ferrets get and what is the treatment?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.diseases_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              Can ferrets get heartworms?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= if @application.heartworms, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Is there a treatment to get rid of heartworms in ferrets?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= if @application.heartworm_treat, do: "yes", else: "no" %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              How do you prevent heartworms in ferrets?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.heartworm_prevent %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Under what conditions would you move to a place which would not accept ferrets? What would you do with yours?
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4">
              <%= @application.move_info %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              What does FOREVER HOME mean to you?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= @application.forever_home %>
            </td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-white px-12 py-4 font-bold">
              Notes, aynthing else you think we need to know, or questions you may have for us:
            </td>
            <td class="border border-neutral-800 bg-white px-12 py-4"><%= @application.notes %></td>
          </tr>
          <tr>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4 font-bold">
              Are you interested in fostering ferrets?
            </td>
            <td class="border border-neutral-800 bg-slate-200 px-12 py-4">
              <%= if @application.fostering, do: "yes", else: "no" %>
            </td>
          </tr>
        </table>
      </div>
    </div>
    """
  end

  def handle_event("send_message", %{"message" => params}, socket) do
    application_id = socket.assigns.application.id

    params = Map.put(params, "application_id", application_id)

    case FerretRescue.send_message(params) do
      {:ok, _message} ->
        messages = FerretRescue.list_messages(application_id)
        changeset = Message.changeset(%{})

        {:noreply, assign(socket, messages: messages, changeset: changeset)}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("approve", _params, socket) do
    application = socket.assigns.application

    application = Map.put(application, :final, true)
    application = Map.put(application, :approved, true)
    application = Map.put(application, :reviewed, true)

    {:noreply, assign(socket, application: application)}
  end

  def handle_event("decline", _params, socket) do
    application = socket.assigns.application

    application = Map.put(application, :final, true)
    application = Map.put(application, :approved, false)
    application = Map.put(application, :reviewed, true)

    {:noreply, assign(socket, application: application)}
  end
end
