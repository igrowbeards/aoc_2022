defmodule Day006Test do
  use ExUnit.Case

  test "find start marker" do
    assert Day006.find_marker_position("mjqjpqmgbljsphdztnvjfqwrcgsmlb", :start) == 7
    assert Day006.find_marker_position("nppdvjthqldpwncqszvftbrmjlhg", :start) == 6
    assert Day006.find_marker_position("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", :start) == 10
    assert Day006.find_marker_position("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", :start) == 11
  end

  test "find message marker" do
    assert Day006.find_marker_position("mjqjpqmgbljsphdztnvjfqwrcgsmlb", :message) == 19
    assert Day006.find_marker_position("bvwbjplbgvbhsrlpgdmjqwftvncz", :message) == 23
    assert Day006.find_marker_position("nppdvjthqldpwncqszvftbrmjlhg", :message) == 23
    assert Day006.find_marker_position("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", :message) == 29
    assert Day006.find_marker_position("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", :message) == 26
  end
end
