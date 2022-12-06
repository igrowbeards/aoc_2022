defmodule Day005.Input do
  def input() do
    "lib/day_005/day_005_input.txt"
    |> File.read!()
    |> parse_input()
  end

  def parse_input(input) do
    [diagram, instructions] =
      input
      |> String.split("\n\n", trim: true)
      |> Enum.map(fn el -> String.split(el, "\n", trim: true) end)

    diagram =
      diagram
      |> Enum.drop(-1)
      |> parse_box_diagram()

    instructions =
      instructions
      |> Enum.map(&parse_move_instruction/1)

    {diagram, instructions}
  end

  def parse_box_diagram(input) do
    cols =
      input
      |> Enum.at(0)
      |> generate_cols()

    Enum.reduce(input, cols, fn el, acc -> parse_row(el, acc) end)
  end

  def parse_move_instruction(instruction_str) do
    [count, orig_from, orig_to] =
      instruction_str
      |> String.split(["move", " ", "from", "to"], trim: true)
      |> Enum.map(&String.to_integer/1)

    %{
      count: count,
      from: orig_from - 1,
      to: orig_to - 1
    }
  end

  defp generate_cols(input) do
    input
    |> String.codepoints()
    |> length()
    |> Kernel./(3)
    |> Float.floor()
    |> trunc()
    |> (fn n -> Range.new(1, n) end).()
    |> Enum.map(fn _ -> [] end)
  end

  def parse_row(row, cols) do
    row
    |> String.codepoints()
    |> Enum.chunk_every(4)
    |> Enum.with_index()
    |> Enum.reduce(cols, fn row_data, cols ->
      add_row(row_data, cols)
    end)
  end

  def add_row({crate, col_index}, cols) do
    case parse_crate(crate) do
      nil ->
        cols

      crate_val ->
        List.replace_at(cols, col_index, Enum.at(cols, col_index) ++ [crate_val])
    end
  end

  def parse_crate(["[", data, "]"]), do: data
  def parse_crate(["[", data, "]", " "]), do: data
  def parse_crate(_), do: nil
end
