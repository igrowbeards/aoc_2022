defmodule Day005 do
  import Day005.Input, only: [input: 0]

  def run_part_1(), do: solve(&move_crates/4)

  def run_part_2(), do: solve(&move_crates_in_bulk/4)

  def solve(solve_fun) do
    {diagram, instructions} = input()

    Enum.reduce(instructions, diagram, fn instruction, acc ->
      solve_fun.(acc, instruction.count, instruction.from, instruction.to)
    end)
    |> calculate_top_crates()
  end

  def calculate_top_crates(crates) do
    Enum.reduce(
      crates,
      "",
      fn row, acc ->
        case row do
          [] -> acc
          [el | _rest] -> acc <> el
        end
      end
    )
  end

  # we've already changed to a zero based index by the time we get here
  def move_crate(cols, from, to) do
    [val | remaining_from] = Enum.at(cols, from)

    cols
    |> List.replace_at(from, remaining_from)
    |> List.replace_at(to, [val | Enum.at(cols, to)])
  end

  def move_crates_in_bulk(cols, count, from, to) do
    {to_move, remaining} =
      cols
      |> Enum.at(from)
      |> Enum.split(count)

    cols
    |> List.replace_at(from, remaining)
    |> List.replace_at(to, to_move ++ Enum.at(cols, to))
  end

  # we've already changed to a zero based index by the time we get here
  def move_crates(cols, count, from, to) do
    Enum.reduce(
      1..count,
      cols,
      fn _count, acc ->
        move_crate(acc, from, to)
      end
    )
  end
end
