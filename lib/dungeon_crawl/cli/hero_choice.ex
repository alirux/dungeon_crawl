defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  import DungeonCrawl.CLI.BaseCommands

  def start do
    #Shell.cmd("clear")
    Shell.info("Choose your hero:")

    heroes = DungeonCrawl.Heroes.all()

    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    # Pass the heroes directly to the function.
    # It'll be the protocol that choose the right field
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero

  end

  defp confirm_hero(choosen_hero) do
    Shell.info("Choosen hero: #{choosen_hero.description}")
    if Shell.yes?("Are you sure?"), do: choosen_hero, else: start()
  end
end
