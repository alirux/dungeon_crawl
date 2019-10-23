defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    crawl(hero_choice(), DungeonCrawl.Room.all())
  end

  defp welcome_message do
    Shell.info("=== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
    Shell.prompt("Press enter to continue...")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  defp crawl(character, rooms) do
    # Pick a random room and start it
    rooms
    |> Enum.random()
    # returns a tuple with {room, chosen_action}
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
    # Execute the trigger and return a tuple { character, action }
    |> trigger_action(character)
    # Execute the found action
    |> handle_action_result
  end

  # Executes the trigger on the room using the character and the choosed action
  defp trigger_action({room, chosen_action}, character) do
    # Executes the trigger
    room.trigger.run(character, chosen_action)
  end

  # Found the exit action
  defp handle_action_result({ _ , :exit }), do: Shell.info("You found the exit, you WON!")
  # Action not recognized: restart to crawl
  defp handle_action_result({ character, _ }), do: crawl(character, DungeonCrawl.Room.all())

end
