defmodule SpiralMemory do
  def calculate(square) do
    root = round(:math.ceil(:math.sqrt(square)))

    length_of_side = if rem(root, 2) != 0 do
      root
    else
      root + 1
    end

    steps_to_centre = (length_of_side-1)/2
    cycle = round(square - :math.pow(length_of_side - 2, 2))
    offset = rem(cycle, length_of_side - 1)
    steps_to_centre + abs(offset - steps_to_centre)
  end
end
