defmodule Day007Test do
  use ExUnit.Case

  # @test_input """
  # $ cd /
  # $ ls
  # dir a
  # 14848514 b.txt
  # 8504156 c.dat
  # dir d
  # $ cd a
  # $ ls
  # dir e
  # 29116 f
  # 2557 g
  # 62596 h.lst
  # $ cd e
  # $ ls
  # 584 i
  # $ cd ..
  # $ cd ..
  # $ cd d
  # $ ls
  # 4060174 j
  # 8033020 d.log
  # 5626152 d.ext
  # 7214296 k
  # """
  test "cd" do
    fs = %Day007.FileSystem{
      current_dir: ["a", "b", "c"]
    }

    fs = Day007.FileSystem.command(fs, "$ cd ..")
    assert fs.current_dir == ["a", "b"]

    fs = Day007.FileSystem.command(fs, "$ cd c")
    assert fs.current_dir == ["a", "b", "c"]
  end

  test "adding results of ls" do
    fs = %Day007.FileSystem{
      current_dir: []
    }
  end
end
