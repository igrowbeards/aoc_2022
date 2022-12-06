defmodule Day006 do
  @message_marker_len 14
  @start_marker_len 4

  def run_part_1() do
    input()
    |> find_marker_position(:start)
  end

  def run_part_2() do
    input()
    |> find_marker_position(:message)
  end

  def find_marker_position(input_str, marker_type) do
    with marker_len <- marker_length(marker_type),
         full <- String.codepoints(input_str),
         len <- length(full),
         rest <- find_unique_of_length(full, marker_len) do
      len - length(rest)
    end
  end

  defp marker_length(marker_type) do
    case marker_type do
      :message -> @message_marker_len
      :start -> @start_marker_len
    end
  end

  defp find_unique_of_length(codepoints, repeat_size) do
    {head, tail} = Enum.split(codepoints, repeat_size)

    if length(Enum.uniq(head)) == repeat_size do
      tail
    else
      [_ | rest] = codepoints
      find_unique_of_length(rest, repeat_size)
    end
  end

  defp input() do
    "lib/day_006/input.txt"
    |> File.read!()
  end
end
