defmodule RealTimeWeb.Router do
  use RealTimeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug RealTimeWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RealTimeWeb do
    pipe_through :browser

    get "/", RoomController, :index
    resources("/rooms", RoomController, except: [:index])
    resources("/sessions", SessionController, only: [:new, :create])
    resources "/registration", RegistrationController, only: [:new, :create]
    # changed from delete to get due to error
    get "/sign_out", SessionController, :delete

    # individually
    # get "/rooms/new", RoomController, :new
    # post "/rooms", RoomController, :create
    # get "/rooms/:id", RoomController, :show
    # get "/rooms/:id/edit", RoomController, :edit
    # put "/rooms/:id", RoomController, :update
    # delete "/rooms/:id", RoomController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", RealTimeWeb do
  #   pipe_through :api
  # end
end
