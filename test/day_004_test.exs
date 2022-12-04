defmodule Day004Test do
  use ExUnit.Case

  @test_input """
  2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8
  """

  test "parsing" do
    assert Day004.parse_line("2-4,6-8") == {2..4, 6..8}
  end

  test "assignments_overlap_totally" do
    refute Day004.assignments_overlap_totally?({2..4, 6..8})
    refute Day004.assignments_overlap_totally?({2..4, 3..5})
    assert Day004.assignments_overlap_totally?({2..8, 3..6})
    assert Day004.assignments_overlap_totally?({2..2, 2..3})
    assert Day004.assignments_overlap_totally?({2..3, 2..2})
    assert Day004.assignments_overlap_totally?({2..2, 2..2})
  end

  test "assignments_overlap" do
    refute Day004.assignments_overlap?({2..4, 6..8})
    refute Day004.assignments_overlap?({2..2, 3..3})
    assert Day004.assignments_overlap?({2..4, 3..5})
    assert Day004.assignments_overlap?({2..8, 3..6})
    assert Day004.assignments_overlap?({2..2, 2..3})
    assert Day004.assignments_overlap?({2..3, 2..2})
    assert Day004.assignments_overlap?({2..2, 2..2})
  end

  test "parsing and counting all completely overlapping assignments" do
    assert Day004.parse_and_count(@test_input, &Day004.assignments_overlap_totally?/1) == 2
  end

  test "parsing and counting all overlapping assignments" do
    assert Day004.parse_and_count(@test_input, &Day004.assignments_overlap?/1) == 4
  end
end
