defmodule Day001 do
  def read_input() do
    File.read!("lib/day_001_input.txt")
  end

  def run_part_1() do
    read_input()
    |> parse_input()
    |> highest_calories()
  end

  def run_part_2() do
    read_input()
    |> parse_input()
    |> highest_calories(3)
  end

  def parse_input(input) do
    input
    |> split_elves_list()
    |> parse_elves_calories()
  end

  def highest_calories(elf_calories, num_elves \\ 1) do
    elf_calories
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(num_elves)
    |> Enum.sum()
  end

  defp split_elves_list(list), do: String.split(list, "\n\n")

  defp parse_elves_calories(elves_list), do: Enum.map(elves_list, &parse_elf_calories/1)

  defp parse_elf_calories(elf_cal_list) do
    elf_cal_list
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end
end
