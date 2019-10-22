# Definition of a room action
defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  # An action have a label and an id
  defstruct label: nil, id: nil

  # Forward action
  def forward, do: %Action{id: :forward, label: "Move forward."}

  # Rest action
  def rest, do: %Action{id: :rest, label: "Take a better look on rest."}

  # Search action
  def search, do: %Action{id: :search, label: "Search the room."}

  # Implements a to_string for this struct
  # No for clause because we are inside the same module
  defimpl String.Chars do
    def to_string(action), do: action.label
  end

end
