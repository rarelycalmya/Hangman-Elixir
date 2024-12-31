defmodule HangmanWeb.GameHTML do
  use HangmanWeb, :html

  # Import the HangmanDrawing component
  import HangmanWeb.Components.HangmanDrawing

  embed_templates "game_html/*"
end
