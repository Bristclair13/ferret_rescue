defmodule FerretRescue.Actions.Login do
  alias FerretRescue.Schemas.Auth
  alias FerretRescue.Repo

  @callback login(String.t(), String.t()) :: {:ok, Auth.t()} | {:error, :invalid}
  def login(email, password) do
    with %Auth{} = auth <- Repo.get_by(Auth, email: email),
         true <- Bcrypt.verify_pass(password, auth.password) do
      {:ok, auth}
    else
      _error -> {:error, :invalid}
    end
  end
end
