defmodule HighEntropyPassphrases do
  @moduledoc """
  Documentation for HighEntropyPassphrases.
  """

  @doc """
  valid?

  ## Examples

  iex> HighEntropyPassphrases.no_duplicate?("aa bb cc dd ee")
  true

  """
  def no_duplicate?(phrase) do
    words = String.split(phrase, " ")
    unique = MapSet.new(words)
    length(words) == MapSet.size(unique)
  end

  def no_anagram?(phrase) do
    words = phrase
            |> String.split(" ")
            |> Enum.map(&(&1 |> String.graphemes |> Enum.sort |> Enum.join("")))
    unique = MapSet.new(words)
    length(words) == MapSet.size(unique)
  end

  def count_valid(s, f) do
    s
    |> String.split("\n")
    |> Enum.count(f)
  end
end
