defmodule FerretRescue do
  alias FerretRescue.Actions

  @behaviour Actions.Login
  @impl Actions.Login
  defdelegate login(email, password), to: Actions.Login

  @behaviour Actions.ListVets
  @impl Actions.ListVets
  defdelegate list_vets(), to: Actions.ListVets
end
