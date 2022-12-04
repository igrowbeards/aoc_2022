defmodule Day001Test do
  use ExUnit.Case

  @raw """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  test "parse input" do
    expected = [
      [1000, 2000, 3000],
      [4000],
      [5000, 6000],
      [7000, 8000, 9000],
      [10000]
    ]

    assert Day001.parse_input(@raw) == expected
  end

  test "highest elf calories" do
    input = Day001.parse_input(@raw)
    assert Day001.highest_calories(input) == 24_000
  end

  test "highest n elf calories" do
    input = Day001.parse_input(@raw)
    assert Day001.highest_calories(input, 3) == 24_000 + 11_000 + 10_000
  end
end
