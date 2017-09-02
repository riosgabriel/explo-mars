defmodule ControlCenter do

  defstruct rovers: [], plateau: %Plateau{}

  def parse_component([x, y], control_center) do
    plateau = %Plateau{max_x: x, max_y: y}
    specify_plateau(control_center, plateau)
  end

  def parse_component([x, y, direction], control_center) do
    rover = %Rover{x: x, y: y, direction: direction}
    deploy_hover(control_center, rover)
  end

  def parse_component([commands], control_center) do
    control_center
  end

  def specify_plateau(control_center, plateau) do
    %{control_center | plateau: plateau}
  end

  def deploy_hover(control_center, rover) do
    %{control_center | rovers: [rover | control_center.rovers]}
  end

#  def execute_commands(control_center, commands, rovers, plateau) do
#    rovers
#    |> Enum.map
#  end

  def display_current_location(rovers) do
    Enum.map(rovers, fn(rover) -> "#{rover.x} #{rover.y} #{rover.direction}" end)
  end

end
