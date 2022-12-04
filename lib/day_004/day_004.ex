defmodule Day004 do
  def run_part_1 do
    input()
    |> parse_and_count(&assignments_overlap_totally?/1)
  end

  def run_part_2 do
    input()
    |> parse_and_count(&assignments_overlap?/1)
  end

  def parse_and_count(str, count_fun) do
    str
    |> String.split()
    |> Enum.map(&parse_line/1)
    |> Enum.count(count_fun)
  end

  def parse_line(line) do
    line
    |> String.split(",")
    |> Enum.map(&to_range/1)
    |> List.to_tuple()
  end

  def assignments_overlap_totally?({s1..e1, s2..e2}) do
    (s1 <= s2 && e1 >= e2) || (s2 <= s1 && e2 >= e1)
  end

  def assignments_overlap?({a, b}), do: !Range.disjoint?(a, b)

  defp input() do
    "lib/day_004/day_004_input.txt"
    |> File.read!()
  end

  defp to_range(input) do
    [start, finish] = input
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)
    Range.new(start, finish)
  end
end
