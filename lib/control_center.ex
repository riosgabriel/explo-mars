defmodule ControlCenter do

  defstruct rovers: [], plateau: %Plateau{}

  def init(args) do
#    |> parse_args
#    |> specify_plateau
#    |> deploy_hover
#    |> execute_commands
#    |> display_current_location
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
