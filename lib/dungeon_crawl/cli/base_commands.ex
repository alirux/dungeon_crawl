defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    # The next two lines are equivalent
    #|> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)
    # The to_string protocol does the magic on elem(&1, 0)
    |> Enum.each(&(Shell.info("#{elem(&1, 1)} - #{elem(&1, 0)}")))

    options
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]\n"
  end

  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

end
