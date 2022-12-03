defmodule Day002P2Test do
  use ExUnit.Case

  # A Y
  # B X
  # C Z

  test "translation" do
    assert Day002P2.translate("A") == :rock
    assert Day002P2.translate("B") == :paper
    assert Day002P2.translate("C") == :scissors
    assert Day002P2.translate("a") == :rock
  end

  test "shape scoring" do
    assert Day002P2.shape_score(:rock) == 1
    assert Day002P2.shape_score(:paper) == 2
    assert Day002P2.shape_score(:scissors) == 3
  end

  test "desired shape" do
    assert Day002P2.desired_shape({:rock, :win}) == {:rock, :paper}
    assert Day002P2.desired_shape({:paper, :win}) == {:paper, :scissors}
    assert Day002P2.desired_shape({:scissors, :win}) == {:scissors, :rock}
    assert Day002P2.desired_shape({:rock, :lose}) == {:rock, :scissors}
    assert Day002P2.desired_shape({:paper, :lose}) == {:paper, :rock}
    assert Day002P2.desired_shape({:scissors, :lose}) == {:scissors, :paper}
    assert Day002P2.desired_shape({:rock, :draw}) == {:rock, :rock}
    assert Day002P2.desired_shape({:paper, :draw}) == {:paper, :paper}
    assert Day002P2.desired_shape({:scissors, :draw}) == {:scissors, :scissors}
  end

  test "parse match" do
    assert Day002P2.parse_match("A Y") == {:rock, :rock}
  end

  test "compare shapes" do
    assert Day002P2.compare_match_shapes({:rock, :paper}) == :win
    assert Day002P2.compare_match_shapes({:paper, :scissors}) == :win
    assert Day002P2.compare_match_shapes({:scissors, :rock}) == :win
    assert Day002P2.compare_match_shapes({:paper, :rock}) == :lose
    assert Day002P2.compare_match_shapes({:scissors, :paper}) == :lose
    assert Day002P2.compare_match_shapes({:rock, :scissors}) == :lose
    assert Day002P2.compare_match_shapes({:rock, :rock}) == :draw
    assert Day002P2.compare_match_shapes({:paper, :paper}) == :draw
    assert Day002P2.compare_match_shapes({:scissors, :scissors}) == :draw
  end

  test "performance score" do
    assert Day002P2.performance_score(:win) == 6
    assert Day002P2.performance_score(:draw) == 3
    assert Day002P2.performance_score(:lose) == 0
  end

  test "single match score" do
    assert Day002P2.match_score({:rock, :paper}) == 8
    assert Day002P2.match_score({:paper, :rock}) == 1
    assert Day002P2.match_score({:scissors, :scissors}) == 6
  end

  test "parse matches" do
    input = """
    A Y
    B X
    C Z
    """

    assert Day002P2.parse_matches(input) == [
      {:rock, :rock},
      {:paper, :rock},
      {:scissors, :rock}
    ]
  end

  test "score matches" do
    matches = [
      {:rock, :paper},
      {:paper, :rock},
      {:scissors, :scissors}
    ]

    assert Day002P2.matches_score(matches) == 15
  end
end
