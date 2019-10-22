defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  import DungeonCrawl.CLI.BaseCommands

  def start do
    #Shell.cmd("clear")
    Shell.info("Choose your hero:")

    heroes = DungeonCrawl.Heroes.all()

    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    # The next two lines are equivalent
    #|> Enum.map(&(&1.name))
    |> Enum.map(fn x -> x.name end)
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
