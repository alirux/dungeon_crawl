# Definition of a Character (hero)
defmodule DungeonCrawl.Character do
  # Defines a struct with the module name: DungeonCrawl.Character
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  # Implements a to_string for this struct
  # No for clause because we are inside the same module
  defimpl String.Chars  do
    def to_string(value), do: value.name
  end
end
