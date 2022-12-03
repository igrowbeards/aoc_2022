defmodule Day003 do
  @lower ~w/a b c d e f g h i j k l m n o p q r s t u v w x y z/
  @upper ~w/A B C D E F G H I J K L M N O P Q R S T U V W X Y Z/

  @priorities @lower ++ @upper
    |> Enum.with_index()
    |> Enum.into(%{}, fn {k, v} -> {k, v + 1} end)

  def run_p1 do
    "lib/day_003/day_003_input.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn el, acc -> acc + priority(el) end)
  end

  def run_p2 do
    "lib/day_003/day_003_input.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(&find_badges/1)
    |> Enum.reduce(0, fn el, acc -> acc + priority(el) end)
  end

  def find_badges([_, _, _] = items) do
    [a, b, c] = items
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&MapSet.new/1)

    a
    |> MapSet.intersection(b)
    |> MapSet.intersection(c)
    |> Enum.at(0)
  end

  def parse_items_string(str) do
    str
    |> String.codepoints()
    |> halve_list()
  end

  def common_item(str) when is_binary str do
    str
    |> parse_items_string()
    |> common_item()
  end

  def common_item([l1, l2]) do
    a = MapSet.new(l1)
    b = MapSet.new(l2)

    a
    |> MapSet.intersection(b)
    |> Enum.at(0)
  end

  def priority(<<_str::size(8)>> = a), do: Map.get(@priorities, a)

  def priority(items_str) do
    item = items_str
    |> common_item()
  
    Map.get(@priorities, item)
  end

  defp halve_list(l), do: Enum.chunk_every(l, round(length(l) / 2))
end
