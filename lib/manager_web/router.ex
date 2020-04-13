defmodule ManagerWeb.Router do
  use ManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ManagerWeb do
    pipe_through :api
  end
end
