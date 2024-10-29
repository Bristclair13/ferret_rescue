defmodule FerretRescueWeb.Live.Faq do
  use FerretRescueWeb, :live_view

  alias FerretRescue.Actions.ListTopics

  def mount(_params, _session, socket) do
    topics = ListTopics.list_topics()
    {:ok, assign(socket, topics: topics)}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-6xl mx-auto flex flex-col">
      <h3 class="text-3xl">Frequently Asked Questions</h3>
      <div class="mt-2 p-4 shadow-lg bg-white flex flex-col gap-y-4">
        <div :for={topic <- @topics}>
          <p class="text-3xl mb-2"><%= topic.name %></p>
          <div :for={question <- topic.questions} class="mb-2">
            <div>
              <button
                type="button"
                class="p-3 w-full text-left border rounded bg-gray-50"
                phx-click={toggle("#question-#{question.id}")}
              >
                <%= question.title %>
              </button>
              <p id={"question-#{question.id}"} class="hidden px-4 py-6 mb-2 border rounded">
                <%= question.content %>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
