defmodule FerretRescueWeb.Live.Application do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Schemas.Message

  def mount(params, _session, socket) do
    application_id = params["id"]
    changeset = Message.changeset(%{})
    messages = FerretRescue.list_messages(application_id)

    # TODO: should return {:ok, application} and should use FerretRescue
    # and handle error
    {:ok, application} = FerretRescue.get_application_by(id: application_id)
    {:ok, assign(socket, application: application, changeset: changeset, messages: messages)}
  end

  def render(assigns) do
    ~H"""
    <div class="bg-white">
      <div class="max-w-7xl mx-auto">
        <div><%= @application.name %></div>
        <div class="flex gap-x-3">
          <.link href={~p"/admin"} class="text-white bg-blue-500 rounded-lg my-auto p-1">
            Go Back
          </.link>
          <.button>Approve</.button>
          <.button>Decline</.button>
        </div>
        <div class="flex flex-col mt-6">
          <h2 class="font-medium text-lg">Status</h2>
          <p>Approved: <%= if @application.approved, do: "yes", else: "no" %></p>
          <div class="flex items-center">
            <p>Reviewed:</p>
            <p
              :if={is_nil(@application.reviewed) or @application.reviewed == false}
              class="p-2 shadow-sm h-4 ml-2 bg-gray-300"
            >
            </p>
            <svg
              :if={@application.reviewed}
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="h-4 ml-2 bg-green-600"
            >
              <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
            </svg>
          </div>
          <div class="flex items-center">
            <p>Final:</p>
            <p
              :if={is_nil(@application.final) or @application.final == false}
              class="p-2 shadow-sm h-4 ml-2 bg-gray-300"
            >
            </p>
            <svg
              :if={@application.final}
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="h-4 ml-2 bg-gray-300"
            >
              <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
            </svg>
          </div>
        </div>
      </div>
      <div class="flex flex-col max-w-7xl mx-auto  mt-6">
        <h2 class="font-medium text-lg">Messages</h2>

        <.form :let={f} for={@changeset} phx-submit="send_message">
          <.input field={f[:message]} type="textarea" label="send message to applicant" />
          <.button class="mt-4 p-2">
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
        <p class="text-2xl mb-2 mt-6">Application</p>
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
end
