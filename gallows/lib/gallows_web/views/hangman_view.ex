defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  import GallowsWeb.Views.Helpers.GameStateHelper

  def game_over?(%{ game_state: game_state }) do
    game_state in [ :won, :lost ]
  end

  def new_game_button(conn) do
    button("New Game", to: hangman_path(conn, :create_game))
  end

  def letters_guessed(%{ letters_guessed: letters_guessed }) do
    letters_guessed |> Enum.join(" ")
  end

  def word_so_far(%{ letters: letters }) do
    letters |> Enum.join(" ")
  end
end
