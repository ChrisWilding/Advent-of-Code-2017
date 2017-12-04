defmodule HighEntropyPassphrasesTest do
  use ExUnit.Case
  doctest HighEntropyPassphrases

  test "check no duplicate words in password" do
    assert HighEntropyPassphrases.no_duplicate?("aa bb cc dd ee") == true
    assert HighEntropyPassphrases.no_duplicate?("aa bb cc dd aa") == false
    assert HighEntropyPassphrases.no_duplicate?("aa bb cc dd aaa") == true
  end

  test "check no duplicate words in each line in password file" do
    s = File.read!(Path.join(File.cwd!, 'test/data.txt'))
    assert HighEntropyPassphrases.count_valid(String.strip(s), &HighEntropyPassphrases.no_duplicate?/1) == 383
  end

  test "check no anagram words in password" do
    assert HighEntropyPassphrases.no_anagram?("abcde fghij") == true
    assert HighEntropyPassphrases.no_anagram?("abcde xyz ecdab") == false
    assert HighEntropyPassphrases.no_anagram?("a ab abc abd abf abj") == true
    assert HighEntropyPassphrases.no_anagram?("iiii oiii ooii oooi oooo") == true
    assert HighEntropyPassphrases.no_anagram?("oiii ioii iioi iiio") == false
  end

  test "check no anagram words in each line in password file" do
    s = File.read!(Path.join(File.cwd!, 'test/data.txt'))
    assert HighEntropyPassphrases.count_valid(String.strip(s), &HighEntropyPassphrases.no_anagram?/1) == 265
  end

end
