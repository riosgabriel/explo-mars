defmodule HoverTest do
  use ExUnit.Case
  doctest ExploMars

  test "when hover was facing to North and the command was 'R' rotate to East" do
    hover = %Hover{x: 0, y: 0, direction: "N"}

    result = Hover.rotate(hover, "R")

    assert "E" == result.direction
  end

  test "when hover was facing to North and the command was 'L' rotate to East" do
    hover = %Hover{x: 0, y: 0, direction: "N"}

    result = Hover.rotate(hover, "L")

    assert "W" == result.direction
  end

  test "when hover was facing to South and the command was 'L' rotate to East" do
    hover = %Hover{x: 0, y: 0, direction: "S"}

    result = Hover.rotate(hover, "L")

    assert "E" == result.direction
  end

  test "when hover was facing to South and the command was 'R' rotate to West" do
    hover = %Hover{x: 0, y: 0, direction: "S"}

    result = Hover.rotate(hover, "R")

    assert "W" == result.direction
  end

  test "when hover was facing to North it was moved to North direction (y + 1)" do
    hover = %Hover{x: 1, y: 1, direction: "N"}

    result = Hover.move(hover)

    assert 2 == result.y
  end

  test "when hover was facing to West it was moved to West direction (x + 1)" do
    hover = %Hover{x: 1, y: 1, direction: "W"}

    result = Hover.move(hover)

    assert 0 == res
  end

end
