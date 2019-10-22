defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    hero_choice()
    crawl(DungeonCrawl.Room.all())
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

  defp crawl(rooms) do
    # Pick a random room and start it
    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
  end
end
