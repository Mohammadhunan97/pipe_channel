defmodule Chatty.Router do
  @moduledoc false

  use Chatty.Web, :router
  require Ueberauth

  # use Phoenix.Router
  # use Phoenix.Router.Socket, mount: "/ws"

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", Chatty do
    pipe_through [:browser]

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end


  scope "/", Chatty do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
<<<<<<< HEAD
    get "/:room/:user", PageController, :index
=======
    get "/:user", PageController, :index
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback

>>>>>>> dafdd89c5bdb07e9a59ea5326a2a51ebc7aee7e1
  end




  # Other scopes may use custom stacks.
  # scope "/api", Chatty do
  #   pipe_through :api
  # end
end
