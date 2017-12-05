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
    array = offsets
            |> Enum.with_index
            |> Enum.reduce(:array.from_list(offsets), fn({n, index}, array) -> :array.set(index, n, array) end)

    jump(array, 0, 0, :array.size(array), update)
  end

  def jump(_, position, count, len, _) when position >= len do
    count
  end

  def jump(offsets, position, count, len, update) do
    current = :array.get(position, offsets)
    new_offsets = :array.set(position, update.(:array.get(position, offsets)), offsets)
    jump(new_offsets, position + current, count + 1, len, update)
  end
end
