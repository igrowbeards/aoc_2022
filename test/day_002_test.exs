defmodule Day002Test do
  use ExUnit.Case

  # A Y
  # B X
  # C Z

  test "translation" do
    assert Day002.translate("A") == :rock
    assert Day002.translate("B") == :paper
    assert Day002.translate("C") == :scissors
    assert Day002.translate("X") == :rock
    assert Day002.translate("Y") == :paper
    assert Day002.translate("Z") == :scissors
    assert Day002.translate("a") == :rock
    assert Day002.translate("z") == :scissors
  end

  test "shape scoring" do
    assert Day002.shape_score(:rock) == 1
    assert Day002.shape_score(:paper) == 2
    assert Day002.shape_score(:scissors) == 3
  end

  test "parse match" do
    assert Day002.parse_match("A Y") == {:rock, :paper}
  end

  test "compare shapes" do
    assert Day002.compare_match_shapes({:rock, :paper}) == :win
    assert Day002.compare_match_shapes({:paper, :scissors}) == :win
    assert Day002.compare_match_shapes({:scissors, :rock}) == :win
    assert Day002.compare_match_shapes({:paper, :rock}) == :lose
    assert Day002.compare_match_shapes({:scissors, :paper}) == :lose
    assert Day002.compare_match_shapes({:rock, :scissors}) == :lose
    assert Day002.compare_match_shapes({:rock, :rock}) == :draw
    assert Day002.compare_match_shapes({:paper, :paper}) == :draw
    assert Day002.compare_match_shapes({:scissors, :scissors}) == :draw
  end

  test "performance score" do
    assert Day002.performance_score(:win) == 6
    assert Day002.performance_score(:draw) == 3
    assert Day002.performance_score(:lose) == 0
  end

  test "single match score" do
    assert Day002.match_score({:rock, :paper}) == 8
    assert Day002.match_score({:paper, :rock}) == 1
    assert Day002.match_score({:scissors, :scissors}) == 6
  end

  test "parse matches" do
    input = """
    A Y
    B X
    C Z
    """

    assert Day002.parse_matches(input) == [
      {:rock, :paper},
      {:paper, :rock},
      {:scissors, :scissors}
    ]
  end

  test "score matches" do
    matches = [
      {:rock, :paper},
      {:paper, :rock},
      {:scissors, :scissors}
    ]

    assert Day002.matches_score(matches) == 15
  end
end
