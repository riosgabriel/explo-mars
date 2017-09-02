defmodule RoverTest do
  use ExUnit.Case
  doctest ExploMars

  test "when rover was facing to North and the command was 'R' rotate to East" do
    rover = %Rover{x: 0, y: 0, direction: "N"}

    result = Rover.rotate(rover, "R")

    assert "E" == result.direction
  end

  test "when rover was facing to North and the command was 'L' rotate to East" do
    rover = %Rover{x: 0, y: 0, direction: "N"}

    result = Rover.rotate(rover, "L")

    assert "W" == result.direction
  end

  test "when rover was facing to South and the command was 'L' rotate to East" do
    rover = %Rover{x: 0, y: 0, direction: "S"}

    result = Rover.rotate(rover, "L")

    assert "E" == result.direction
  end

  test "when rover was facing to South and the command was 'R' rotate to West" do
    rover = %Rover{x: 0, y: 0, direction: "S"}

    result = Rover.rotate(rover, "R")

    assert "W" == result.direction
  end

  test "when rover was facing to North it was moved to North direction (y + 1)" do
    rover = %Rover{x: 1, y: 1, direction: "N"}

    result = Rover.move(rover)

    assert 2 == result.y
  end

  test "when rover was facing to West it was moved to West direction (x + 1)" do
    rover = %Rover{x: 1, y: 1, direction: "W"}

    result = Rover.move(rover)

    assert 0 == res
  end
  
  test "when send a wrong command to rover" do
    rover = %Rover{}

    Rover.rotate(rover, "X")
  end

end
