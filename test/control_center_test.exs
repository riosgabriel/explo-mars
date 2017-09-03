defmodule ControlCenterTest do
  use ExUnit.Case

  test "Parse a Plateau" do
    control_center = %ControlCenter{}

    result = ControlCenter.parse_component([1, 2], control_center)

    assert result.plateau.max_x == 1
    assert result.plateau.max_y == 2
  end

  test "Parse a Rover" do
    control_center = %ControlCenter{plateau: %Plateau{max_x: 5, max_y: 5}}

    result = ControlCenter.parse_component([1, 2, "N"], control_center)

    assert result.current_rover.direction == "N"
    assert result.current_rover.x == 1
    assert result.current_rover.y == 2
  end

end
