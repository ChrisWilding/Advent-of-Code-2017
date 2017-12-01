defmodule InverseCaptcha do
  @moduledoc """
  Documentation for InverseCaptcha.
  """

  @doc """
  InverseCaptcha.calculate

  ## Examples

  iex> InverseCaptcha.calculate("1111", fn(_) -> 1 end)
  4

  """
  def calculate(input, offset) do
    integers = input
               |> String.graphemes
               |> Enum.map(&String.to_integer/1)

    offset_integers = Stream.cycle(integers)
                      |> Stream.drop(offset.(integers))
                      |> Enum.take(length(integers))

    integers
    |> Enum.zip(offset_integers)
    |> Enum.reduce(0, fn
      {n, n}, acc -> n + acc
      {_, _}, acc -> acc
    end)
  end
end
