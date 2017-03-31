defmodule ImageSharing.Router do
  use ImageSharing.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end


  scope "/", ImageSharing do
    pipe_through :browser
    get "/", PageController, :index
    get "/images/random", ImageController, :random_image
    resources "/images", ImageController, except: [:edit, :update, :delete]
  end
end
