defmodule Checksum do
  def checksum(s, f) do
    stripped = String.strip(s)
    rows = String.split(stripped, "\n")
    fields = Enum.map(rows, &(String.split(&1, "\t")))
    Enum.reduce(fields, 0, fn(row, acc) ->
      numbers = Enum.map(row, &String.to_integer/1)

      acc + f.(numbers)
    end)
  end
end
