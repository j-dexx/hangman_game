defmodule TextClient.Interact do

  # Name of node on host
  @hangman_server :hangman@localhost

  alias TextClient.{Player, State}

  def start() do
    new_game()
    |> setup_state()
    |> Player.play()
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game),
    }
  end

  defp new_game() do
    Node.connect(@hangman_server)
    # Call hangman server and start new game
    :rpc.call(@hangman_server, Hangman, :new_game, [])
  end
end
