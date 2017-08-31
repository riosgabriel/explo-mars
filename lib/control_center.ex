defmodule ControlCenter do

  defstruct hovers: [], plateau: %Plateau{}

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

  def deploy_hover(control_center, hover) do
    %{control_center | hovers: [hover | control_center.hovers]}
  end

  def execute_commands(commands, hovers, plateau) do

  end

  def display_current_location(hovers) do
    Enum.map(hovers, fn(hover) -> "#{hover.x} #{hover.y} #{hover.direction}" end)
  end

end
