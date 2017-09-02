defmodule ControlCenter do

  defstruct rovers: [], plateau: %Plateau{}

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
    IO.puts "Specifying Plateau "
    IO.inspect plateau
    %{control_center | plateau: plateau}
  end

  defp deploy_hover(rover, control_center) do
    IO.puts "Deploying rover "
    IO.inspect rover

    %{control_center | rovers: [rover | control_center.rovers]}
  end

  defp execute_commands(commands, control_center) do
    IO.puts "Executing Commands "
    IO.inspect commands

    new_rovers = Enum.map(control_center.rovers, fn(rover) -> Rover.execute_commands(rover, commands) end)

    %{control_center | rovers: new_rovers}
  end

  def display_current_location(rovers) do
    Enum.each(rovers, fn(rover) -> IO.puts "#{rover.x} #{rover.y} #{rover.direction}" end)
  end

end
