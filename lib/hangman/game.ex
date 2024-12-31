defmodule Hangman.Game do
  defstruct [
    word: "",
    guessed_letters: MapSet.new(),
    remaining_attempts: 6
  ]

  def new(word \\ nil) do
    word = word || random_word()
    %__MODULE__{word: String.downcase(word)}
  end

  def guess(game, letter) do
    letter = String.downcase(letter)

    cond do
      MapSet.member?(game.guessed_letters, letter) ->
        {:already_guessed, game}
      true ->
        game = %{game | guessed_letters: MapSet.put(game.guessed_letters, letter)}
        game =
          if String.contains?(game.word, letter) do
            game
          else
            %{game | remaining_attempts: game.remaining_attempts - 1}
          end
        {:ok, game}
    end
  end

  def word_so_far(game) do
    game.word
    |> String.graphemes()
    |> Enum.map(fn letter ->
      if MapSet.member?(game.guessed_letters, letter) do
        letter
      else
        "_"
      end
    end)
    |> Enum.join(" ")
  end

  def game_over?(game) do
    won?(game) || lost?(game)
  end

  def won?(game) do
    game.word
    |> String.graphemes()
    |> Enum.all?(fn letter -> MapSet.member?(game.guessed_letters, letter) end)
  end

  def lost?(game) do
    game.remaining_attempts <= 0
  end

  defp random_word do
    ~w(phoenix elixir programming computer hangman)
    |> Enum.random()
  end
end

