defmodule Day003 do
  @lower ~w/a b c d e f g h i j k l m n o p q r s t u v w x y z/
  @upper ~w/A B C D E F G H I J K L M N O P Q R S T U V W X Y Z/
  @item_codes @lower ++ @upper
  @priorities @item_codes
    |> Enum.with_index()
    |> Enum.into(%{}, fn {k, v} -> {k, v + 1} end)

  def run_p1 do
    "lib/day_003/day_003_input.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn el, acc -> acc + priority(el) end)
  end

  def parse_items_string(str) do
    str
    |> String.codepoints()
    |> halve_list()
  end

  def common_items(str) when is_binary str do
    str
    |> parse_items_string()
    |> common_items()
  end

  def common_items([l1, l2]) do
    MapSet.intersection(MapSet.new(l1), MapSet.new(l2))
    |> MapSet.to_list()
  end

  def priority(<<_str::size(8)>> = a) do
    Map.get(@priorities, a)
  end

  def priority(items_str) do
    a = items_str
    |> common_items()
    |> Enum.at(0)
  
    Map.get(@priorities, a)
  end

  defp halve_list(l) do
    Enum.chunk_every(l, round(length(l) / 2))
  end
end
