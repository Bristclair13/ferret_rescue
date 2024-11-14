defmodule FerretRescueWeb.Live.Application do
  use FerretRescueWeb, :admin_live_view

  alias FerretRescue.Schemas.Message
  alias FerretRescue.Actions.GetApplication, as: Get

  def mount(params, _session, socket) do
    application_id = params["id"]
    changeset = Message.changeset(%{})

    application = Get.get(application_id)
    {:ok, assign(socket, application: application, changeset: changeset)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div><%= @application.name %></div>
      <div class="flex gap-x-3">
        <.button>Go Back</.button>
        <.button>Approve</.button>
        <.button>Decline</.button>
      </div>
      <div class="flex flex-col mt-6">
        <h2>Status</h2>
        <p>Approved: <%= @application.approved %></p>
        <p>Reviewed: <%= @application.reviewed %></p>
        <p>Final: <%= @application.final %></p>
      </div>
      <div class="flex flex-col">
        <h2>Messages</h2>

        <.form :let={f} for={@changeset} phx-submit="submit_message">
          <.input field={f[:message]} type="textarea" label="send message to applicant" />
          <.button class="mt-4">
            Send
          </.button>
        </.form>
      </div>
      <div class="flex flex-col">
        <p>Message history</p>
        <table>
          <thead>
            <tr>
              <th scope="col" class="border border-neutral-800 bg-white px-12 py-4">Sent at</th>
              <th scope="col" class="border border-neutral-800 bg-white px-24 py-4">Message</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="flex flex-col">
        <p>Application</p>
      </div>
    </div>
    """
  end
end
