defmodule Hover do

  defstruct x: 0, y: 0, direction: "N"

  def execute_command(hover, command) do
    case command do
      "M" -> move(hover)
      "R" -> rotate(hover, "R")
      "L" -> rotate(hover, "L")
    end
  end

  def rotate(hover, "L") do
    case hover.direction do
      "N" -> %{hover | direction: "W"}
      "W" -> %{hover | direction: "S"}
      "E" -> %{hover | direction: "N"}
      "S" -> %{hover | direction: "E"}
    end
  end

  def rotate(hover, "R") do
    case hover.direction do
      "N" -> %{hover | direction: "E"}
      "W" -> %{hover | direction: "N"}
      "E" -> %{hover | direction: "S"}
      "S" -> %{hover | direction: "W"}
    end
  end

  def move(hover) do
    case hover.direction do
      "N" -> %{hover | y: hover.y + 1}
      "W" -> %{hover | x: hover.x - 1}
      "E" -> %{hover | x: hover.x + 1}
      "S" -> %{hover | y: hover.y - 1}
    end
  end

end
