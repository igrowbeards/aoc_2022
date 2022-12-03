defmodule Day003Test do
  use ExUnit.Case

  test "it works" do
    input = "vJrwpWtwJgWrhcsFMMfFFhFp"

    expected = [
      ["v", "J", "r", "w", "p", "W", "t", "w", "J", "g", "W", "r"],
      ["h", "c", "s", "F", "M", "M", "f", "F", "F", "h", "F", "p"]
    ]

    assert Day003.parse_items_string(input) == expected
  end

  test "find common items" do
    input = [
      ["v", "J", "r", "w", "p", "W", "t", "w", "J", "g", "W", "r"],
      ["h", "c", "s", "F", "M", "M", "f", "F", "F", "h", "F", "p"]
    ]

    assert Day003.common_item(input) == "p"
  end

  test "parse and find common items" do
    input = "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
    assert Day003.common_item(input) == "L"

    input = "PmmdzqPrVvPwwTWBwg"
    assert Day003.common_item(input) == "P"

    input = "ttgJtRGJQctTZtZT"
    assert Day003.common_item(input) == "t"

    input = "CrZsJsPPZsGzwwsLwLmpwMDw"
    assert Day003.common_item(input) == "s"
  end

  test "priorities" do
    assert Day003.priority("p") == 16
    assert Day003.priority("L") == 38
    assert Day003.priority("P") == 42
    assert Day003.priority("v") == 22
    assert Day003.priority("t") == 20
    assert Day003.priority("s") == 19

    assert Day003.priority("vJrwpWtwJgWrhcsFMMfFFhFp") == 16
  end

  # part 2
  test 'find badges' do
    input = ~w/vJrwpWtwJgWrhcsFMMfFFhFp jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL PmmdzqPrVvPwwTWBwg/
    assert Day003.find_badges(input) == "r"

    input = ~w/wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn ttgJtRGJQctTZtZT CrZsJsPPZsGzwwsLwLmpwMDw/
    assert Day003.find_badges(input) == "Z"
  end
end
