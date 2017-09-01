defmodule Rover do

  defstruct x: 0, y: 0, direction: "N"

  def execute_command(rover, command) do
    case command do
      "M" -> move(rover)
      "R" -> rotate(rover, "R")
      "L" -> rotate(rover, "L")
    end
  end

  def rotate(rover, "L") do
    case rover.direction do
      "N" -> %{rover | direction: "W"}
      "W" -> %{rover | direction: "S"}
      "E" -> %{rover | direction: "N"}
      "S" -> %{rover | direction: "E"}
    end
  end

  def rotate(rover, "R") do
    case rover.direction do
      "N" -> %{rover | direction: "E"}
      "W" -> %{rover | direction: "N"}
      "E" -> %{rover | direction: "S"}
      "S" -> %{rover | direction: "W"}
    end
  end

  def move(rover) do
    case rover.direction do
      "N" -> %{rover | y: rover.y + 1}
      "W" -> %{rover | x: rover.x - 1}
      "E" -> %{rover | x: rover.x + 1}
      "S" -> %{rover | y: rover.y - 1}
    end
  end

end
