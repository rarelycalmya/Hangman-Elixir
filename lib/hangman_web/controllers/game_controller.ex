defmodule HangmanWeb.GameController do
  use HangmanWeb, :controller

  def new(conn, _params) do
    game = Hangman.Game.new()
    conn
    |> put_session(:game, game)
    |> redirect(to: ~p"/game")
  end

  def show(conn, _params) do
    game = get_session(conn, :game) || Hangman.Game.new()
    render(conn, :show, game: game)
  end

  def update(conn, %{"guess" => guess}) do
    game = get_session(conn, :game)

    case Hangman.Game.guess(game, guess) do
      {:ok, new_game} ->
        conn
        |> put_session(:game, new_game)
        |> redirect(to: ~p"/game")

      {:already_guessed, _game} ->
        conn
        |> put_flash(:error, "Letter already guessed!")
        |> redirect(to: ~p"/game")
    end
  end
end
