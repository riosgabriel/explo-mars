defmodule ControlCenter do

  defstruct current_rover: %Rover{}, plateau: %Plateau{}, rovers: []

  def parse_component([x, y], control_center) do
    specify_plateau(%Plateau{max_x: x, max_y: y}, control_center)
  end

  def parse_component([x, y, direction], control_center) do
    deploy_hover(%Rover{x: x, y: y, direction: direction}, control_center)
  end

  def parse_component([commands], control_center) do
    execute_commands(commands, control_center)
  end

  defp specify_plateau(plateau, control_center) do
    %{control_center | plateau: plateau}
  end

  defp deploy_hover(rover, control_center) do
    %{control_center | current_rover: rover}
  end

  defp execute_commands(commands, control_center) do
    rover = Rover.execute_commands(control_center.current_rover, commands)

    %{control_center | rovers: [rover | control_center.rovers]}
  end

  def display_current_location(rovers) do
    rovers
    |> Enum.reverse
    |> Enum.each(fn(rover) -> IO.puts "#{rover.x} #{rover.y} #{rover.direction}" end)
  end

end
