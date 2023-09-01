defmodule Day007 do
  defmodule Dir do
    defstruct [
      name: "/",
      contents: [],
      size: 0
    ]
  end

  defmodule File do
    @enforce_keys [:name]
    defstruct [
      :name,
      size: 0
    ]
  end

  defmodule FileSystem do
    defstruct [
      :current_dir,
      system: %Day007.Dir{}
    ]

    def command(%FileSystem{} = fs, "$ cd ..") do
      %FileSystem{ fs | current_dir: Enum.drop(fs.current_dir, -1) }
    end

    def command(%FileSystem{} = fs, "$ cd " <> dir) do
      %FileSystem{fs | current_dir: fs.current_dir ++ [dir]}
    end

    def command(%FileSystem{} = fs, "dir " <> dir_name) do
      add_dir(fs, dir_name)
    end

    def command(%FileSystem{} = fs, _command), do: fs

    defp add_dir(%FileSystem{} = fs, dir_name) do
      fs
    end
  end

end
