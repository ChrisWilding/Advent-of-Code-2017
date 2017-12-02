defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  test "calculates the checksum" do
    s = File.read!(Path.join(File.cwd!, 'test/data.txt'))

    f = fn(numbers) ->
      min = Enum.min(numbers)
      max = Enum.max(numbers)
      max - min
    end

    assert Checksum.checksum(s, f) == 41919
  end

  test "calculates the checksum for multiples" do
    s = File.read!(Path.join(File.cwd!, 'test/data.txt'))

    f = fn(numbers) ->
      div = for a <- numbers, b <- numbers, a != b, rem(a, b) == 0, do: div(a, b)
      List.first(div)
    end

    assert Checksum.checksum(s, f) == 303
  end
end
