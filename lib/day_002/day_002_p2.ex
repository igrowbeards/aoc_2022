defmodule Day002P2 do
  def run_part_2 do
    "lib/day_002_input.txt"
    |> File.read!()
    |> parse_matches()
    |> matches_score()
  end

  def matches_score(matches) do
    Enum.reduce(matches, 0, fn match, acc -> acc + match_score(match) end)
  end

  def translate("A"), do: :rock
  def translate("B"), do: :paper
  def translate("C"), do: :scissors

  def translate("X"), do: :lose
  def translate("Y"), do: :draw
  def translate("Z"), do: :win

  def translate(other) when other in ["a", "b", "c", "x", "y", "z"] do
    other
    |> String.upcase()
    |> translate()
  end

  def shape_score(:rock), do: 1
  def shape_score(:paper), do: 2
  def shape_score(:scissors), do: 3

  def desired_shape({throw, :win}), do: {throw, win(throw)}
  def desired_shape({throw, :lose}), do: {throw, lose(throw)}
  def desired_shape({throw, :draw}), do: {throw, throw}

  def win(:rock), do: :paper
  def win(:paper), do: :scissors
  def win(:scissors), do: :rock

  def lose(:rock), do: :scissors
  def lose(:paper), do: :rock
  def lose(:scissors), do: :paper

  def parse_match(match_string) do
    match_string
    |> String.split()
    |> Enum.map(&translate/1)
    |> List.to_tuple()
    |> desired_shape()
  end

  def parse_matches(matches_string) do
    matches_string
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_match/1)
  end

  def compare_match_shapes({:rock, :paper}), do: :win
  def compare_match_shapes({:paper, :scissors}), do: :win
  def compare_match_shapes({:scissors, :rock}), do: :win
  def compare_match_shapes({:rock, :scissors}), do: :lose
  def compare_match_shapes({:paper, :rock}), do: :lose
  def compare_match_shapes({:scissors, :paper}), do: :lose
  def compare_match_shapes({_, _}), do: :draw

  def performance_score(:win), do: 6
  def performance_score(:draw), do: 3
  def performance_score(:lose), do: 0

  def match_score(match) do
    perf_score =
      match
      |> compare_match_shapes()
      |> performance_score()

    shape_score =
      match
      |> elem(1)
      |> shape_score()

    perf_score + shape_score
  end
end
