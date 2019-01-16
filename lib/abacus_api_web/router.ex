defmodule AbacusApiWeb.Router do
  use AbacusApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AbacusApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
