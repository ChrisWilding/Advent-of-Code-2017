defmodule MazeTest do
  use ExUnit.Case
  doctest Maze

  test "calculates the steps required to escape" do
    update = &(&1 + 1)
    assert Maze.steps([0, 3, 0, 1, -3], update) == 5
  end

  test "calculates the steps required to escape using data" do
    s = Path.join(File.cwd!, 'test/data.txt')
        |> File.read!
        |> String.trim
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)

    update = &(&1 + 1)
    assert Maze.steps(s, update) == 396086
  end


  test "calculates the steps required to escape with a custom update" do
    update = &(if &1 > 2 do &1 - 1 else &1 + 1 end)
    assert Maze.steps([0, 3, 0, 1, -3], update) == 10
  end

  test "calculates the steps required to escape using data and a custom update" do
    s = Path.join(File.cwd!, 'test/data.txt')
        |> File.read!
        |> String.trim
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)

    update = &(if &1 > 2 do &1 - 1 else &1 + 1 end)
    assert Maze.steps(s, update) == 28675390
  end
end
