defmodule ManagerWeb.Router do
  use ManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ManagerWeb do
    pipe_through :api

    post "/create", ManagerController, :create
    get "/user/:id", ManagerController, :index
    put "/user/:id", ManagerController, :update
    delete "/user/:id", ManagerController, :delete
  end
end
