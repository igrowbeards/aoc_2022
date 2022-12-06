defmodule Day005Test do
  use ExUnit.Case

  @test_input """
      [D]   
  [N] [C]    
  [Z] [M] [P]
  """
  @parsed [
    ["N", "Z"],
    ["D", "C", "M"],
    ["P"]
  ]

  test "final top crates" do
    input = [
      ["C"],
      ["M"],
      ["Z", "N", "D", "P"]
    ]

    assert Day005.calculate_top_crates(input) == "CMZ"
  end

  test "parse row" do
    input = "[D]        "
    cols = [[], [], []]
    assert Day005.Input.parse_row(input, cols) == [["D"], [], []]
  end

  test "parse_box_diagram" do
    result =
      @test_input
      |> String.split("\n", trim: true)
      |> Day005.Input.parse_box_diagram()

    assert result == @parsed
  end

  test "move crate" do
    assert Day005.move_crate(@parsed, 1, 0) ==
             [
               ["D", "N", "Z"],
               ["C", "M"],
               ["P"]
             ]
  end

  test "moving crates" do
    first_move = Day005.move_crates(@parsed, 1, 1, 0)

    assert first_move == [
             ["D", "N", "Z"],
             ["C", "M"],
             ["P"]
           ]

    second_move = Day005.move_crates(first_move, 3, 0, 2)

    assert second_move == [
             [],
             ["C", "M"],
             ["Z", "N", "D", "P"]
           ]

    third_move = Day005.move_crates(second_move, 2, 1, 0)

    assert third_move == [
             ["M", "C"],
             [],
             ["Z", "N", "D", "P"]
           ]

    fourth_move = Day005.move_crates(third_move, 1, 0, 1)

    assert fourth_move == [
             ["C"],
             ["M"],
             ["Z", "N", "D", "P"]
           ]
  end

  test "moving crates in bulk" do
    first_move = Day005.move_crates_in_bulk(@parsed, 1, 1, 0)

    assert first_move == [
             ["D", "N", "Z"],
             ["C", "M"],
             ["P"]
           ]
  end

  test "parsing move instructions" do
    input = "move 1 from 2 to 1"

    assert Day005.Input.parse_move_instruction(input) == %{
             count: 1,
             from: 1,
             to: 0
           }
  end

  test "parsing whole input" do
    input = """
        [D]    
    [N] [C]    
    [Z] [M] [P]
     1   2   3 

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
    """

    result = Day005.Input.parse_input(input)

    assert result == {
             @parsed,
             [
               %{count: 1, from: 1, to: 0},
               %{count: 3, from: 0, to: 2},
               %{count: 2, from: 1, to: 0},
               %{count: 1, from: 0, to: 1}
             ]
           }
  end
end
