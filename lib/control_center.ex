defmodule ControlCenter do

  defstruct rovers: [], plateau: %Plateau{}

  def parse_component(control_center, {x, y}) do
#    specify_plateau(control_center, x, y)
    IO.puts "Plateau: (#{x}, #{y})"
  end

  def parse_component(control_center, {x, y, direction}) do
    IO.puts "Hover: (#{x}, #{y}, #{direction})"
#    deploy_hover(control_center, %Rover{x: x, y: y, direction: direction})
  end

  def parse_component(commands) do
    IO.puts "Commands: #{String.codepoints(commands)}"
  end



  def specify_plateau(control_center, x, y) do
    %{control_center | plateau: %Plateau{max_x: x, max_y: y}}
  end

  def deploy_hover(control_center, rover) do
    %{control_center | rovers: [rover | control_center.hovers]}
  end

  def execute_commands(commands, rovers, plateau) do

  end

  def display_current_location(rovers) do
    Enum.map(rovers, fn(rover) -> "#{rover.x} #{rover.y} #{rover.direction}" end)
  end

end
