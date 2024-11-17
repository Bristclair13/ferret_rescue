defmodule FerretRescue do
  alias FerretRescue.Actions

  @behaviour Actions.Login
  @impl Actions.Login
  defdelegate login(email, password), to: Actions.Login

  @behaviour Actions.ListVets
  @impl Actions.ListVets
  defdelegate list_vets(), to: Actions.ListVets

  @behaviour Actions.GetApplication
  @impl Actions.GetApplication
  defdelegate get_application(id), to: Actions.GetApplication

  @behaviour Actions.GetAuth
  @impl Actions.GetAuth
  defdelegate get_auth_by(by), to: Actions.GetAuth

  @behaviour Actions.ListApplications
  @impl Actions.ListApplications
  defdelegate list_applications(opts), to: Actions.ListApplications

  @behaviour Actions.ListFerrets
  @impl Actions.ListFerrets
  defdelegate list_ferrets(), to: Actions.ListFerrets

  @behaviour Actions.ListMessages
  @impl Actions.ListMessages
  defdelegate list_messages(), to: Actions.ListMessages

  @behaviour Actions.ListSitters
  @impl Actions.ListSitters
  defdelegate list_sitters(), to: Actions.ListSitters

  @behaviour Actions.ListTopics
  @impl Actions.ListTopics
  defdelegate list_topics(), to: Actions.ListTopics
end
