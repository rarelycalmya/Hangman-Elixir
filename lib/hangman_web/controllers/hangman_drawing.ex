defmodule HangmanWeb.Components.HangmanDrawing do
  use Phoenix.Component

  attr :remaining_attempts, :integer, required: true

  def hangman(assigns) do
    ~H"""
    <svg viewBox="0 0 200 250" class="w-64 h-80 border">
      <!-- Base -->
      <line x1="20" y1="230" x2="100" y2="230" stroke="black" stroke-width="3"/>
      <!-- Vertical pole -->
      <line x1="60" y1="230" x2="60" y2="50" stroke="black" stroke-width="3"/>
      <!-- Horizontal beam -->
      <line x1="60" y1="50" x2="140" y2="50" stroke="black" stroke-width="3"/>
      <!-- Rope -->
      <line x1="140" y1="50" x2="140" y2="70" stroke="black" stroke-width="3"/>

      <!-- Head (shows when 5 attempts remaining) -->
      <%= if @remaining_attempts <= 5 do %>
        <circle cx="140" cy="90" r="20" stroke="black" fill="none" stroke-width="3"/>
      <% end %>

      <!-- Body (shows when 4 attempts remaining) -->
      <%= if @remaining_attempts <= 4 do %>
        <line x1="140" y1="110" x2="140" y2="170" stroke="black" stroke-width="3"/>
      <% end %>

      <!-- Left arm (shows when 3 attempts remaining) -->
      <%= if @remaining_attempts <= 3 do %>
        <line x1="140" y1="130" x2="110" y2="150" stroke="black" stroke-width="3"/>
      <% end %>

      <!-- Right arm (shows when 2 attempts remaining) -->
      <%= if @remaining_attempts <= 2 do %>
        <line x1="140" y1="130" x2="170" y2="150" stroke="black" stroke-width="3"/>
      <% end %>

      <!-- Left leg (shows when 1 attempt remaining) -->
      <%= if @remaining_attempts <= 1 do %>
        <line x1="140" y1="170" x2="110" y2="210" stroke="black" stroke-width="3"/>
      <% end %>

      <!-- Right leg (shows when 0 attempts remaining) -->
      <%= if @remaining_attempts <= 0 do %>
        <line x1="140" y1="170" x2="170" y2="210" stroke="black" stroke-width="3"/>
      <% end %>
    </svg>
    """
  end
end
