defmodule FerretRescueWeb.Router do
  use FerretRescueWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FerretRescueWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  live_session :default, on_mount: [FerretRescueWeb.Middleware.Nav.Hook] do
    scope "/", FerretRescueWeb.Live do
      pipe_through :browser

      live "/", Home
      live "/adopt", Adopt
      live "/contact", Contact
      live "/foster", Fosters
      live "/sitter", Sitters
      live "/vet", Vets
      live "/faq", Faq
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", FerretRescueWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:ferret_rescue, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FerretRescueWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
