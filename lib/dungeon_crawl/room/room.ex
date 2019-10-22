# Definition of rooms
defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room

  import DungeonCrawl.Room.Action

  # A room have a descriprion and a list of actions
  defstruct description: nil, actions: []

  # List of all available rooms
  def all, do: [
    %Room{
      description: "You found a quiet place. Looks safe for a little nap.",
      # Two actions available for this room
      actions: [forward(), rest()]
    }
  ]
end
