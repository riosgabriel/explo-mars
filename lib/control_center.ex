defmodule ControlCenter do

  defstruct current_rover: :empty, plateau: %Plateau{}, rovers: [], errors: []

  def parse_component([x, y], control_center) do
    specify_plateau(%Plateau{max_x: x, max_y: y}, control_center)
  end

  def parse_component([x, y, direction], control_center) do
    cond do
      is_out_of_boundaries(x, y, control_center.plateau) ->
        %{control_center | errors: [{:error, "Could not deploy rover on position x=#{x} y=#{y}"} | control_center.errors]}
      true ->
        deploy_hover(%Rover{x: x, y: y, direction: direction}, control_center)
    end
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
    case control_center.current_rover do
      :empty -> control_center
      _ -> result = Rover.execute_commands(control_center.current_rover, commands)
           case result do
             {:error, reason} -> %{control_center | errors: [{:error, reason} | control_center.errors]}
             _ -> %{control_center | rovers: [result | control_center.rovers]}
           end
    end
  end

  defp is_out_of_boundaries(x, y, plateau) do
    x < 0 || x > plateau.max_x || y < 0 || y > plateau.max_y
  end

  def display_current_location(rovers) do
    rovers
    |> Enum.reverse
    |> Enum.each(fn(rover) -> IO.puts "#{rover.x} #{rover.y} #{rover.direction}" end)
  end

  def display_errors(errors) do
    errors
    |> Enum.reverse
    |> Enum.each(fn(error) -> IO.inspect error end)
  end

end
