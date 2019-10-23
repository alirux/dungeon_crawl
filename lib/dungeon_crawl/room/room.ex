# Definition of rooms
defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  # A room have a descriprion, a list of actions and a trigger
  defstruct description: nil, actions: [], trigger: nil

  # List of all available rooms
  def all, do: [
    %Room{
      description: "You can see the light of day. You found the exit!",
      # Only one actions available for this room
      actions: [forward()],
      trigger: Triggers.Exit
    }
  ]
end
