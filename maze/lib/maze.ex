defmodule Maze do
  @moduledoc """
  Documentation for Maze.
  """

  @doc """
  offsets.

  ## Examples

      iex> Maze.steps([0, 3, 0, 1, -3], &(&1 + 1))
      5
  """
  def steps(offsets, update) do
    jump(offsets, 0, 0, update)
  end

  def jump(offsets, position, count, _) when position >= length(offsets) do
    count
  end

  def jump(offsets, position, count, update) do
    current = Enum.at(offsets, position)

    new_offsets = List.update_at(offsets, position, update)

    jump(new_offsets, position + current, count + 1, update)
  end
end
