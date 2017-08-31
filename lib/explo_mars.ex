defmodule ExploMars do

  def main(args) do

#    plateau = %{max_x: 5, max_y: 5}
    hover1 = %Hover{x: 1, y: 2, direction: "N"}
    commands1 = "LMLMLMLMM"

    result = Enum.reduce(String.codepoints(commands1), hover1, fn(c, h) -> Hover.execute_command(h, c) end)

    IO.puts print(result)

    hover2 = %Hover{x: 3, y: 3, direction: "E"}
    commands2 = "MMRMMRMRRM"

    result2 = Enum.reduce(String.codepoints(commands2), hover2, fn(c, h) -> Hover.execute_command(h, c) end)

    IO.puts print(result2)

  end

  def print(hover) do
    "#{hover.x} #{hover.y} #{hover.direction}"
  end

end
