defmodule HangmanWeb.Router do
  use HangmanWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HangmanWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", HangmanWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/game/new", GameController, :new
    get "/game", GameController, :show
    post "/game", GameController, :update
  end
end
