defmodule SpiralMemoryTest do
  use ExUnit.Case
  doctest SpiralMemory

  test "calculates the number of steps" do
    assert SpiralMemory.calculate(361527) == 326
  end
end
