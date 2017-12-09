defmodule RegistersTest do
  use ExUnit.Case
  doctest Registers

  test "calculates the largest value in any register at the end" do
    input = ["b inc 5 if a > 1", "a inc 1 if b < 5", "c dec -10 if a >= 1", "c inc -20 if c == 10"]

    assert Registers.max_register_at_end(input) == 1
  end

  test "calculates the largest value in any register at the end for the example data file" do
    input = Path.join(File.cwd!, 'test/data.txt')
            |> File.read!
            |> String.trim
            |> String.split("\n")

    assert Registers.max_register_at_end(input) == 7296
  end

test "calculates the largest value in any register throughout the calculation for the example data file" do
  input = Path.join(File.cwd!, 'test/data.txt')
          |> File.read!
          |> String.trim
          |> String.split("\n")

  assert Registers.max_register_throughout(input) == 7296
end
end
