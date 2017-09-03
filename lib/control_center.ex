defmodule ControlCenter do

  defstruct current_rover: :empty, plateau: %Plateau{}, rovers: []

  def parse_component([x, y], control_center) do
    %{control_center | plateau: %Plateau{max_x: x, max_y: y}}
  end

  def parse_component([x, y, direction], control_center) do
    cond do
      is_out_of_boundaries(x, y, control_center.plateau) ->
      control_center
      true -> %{control_center | current_rover: %Rover{x: x, y: y, direction: direction}}
    end
  end

  def parse_component([commands], control_center) do
    case control_center.current_rover do
      :empty -> control_center
      _ ->
        rover = Rover.execute_commands(control_center.current_rover, commands)
        cond do
          is_out_of_boundaries(rover.x, rover.y, control_center.plateau) ->
            control_center
          true ->
            %{control_center | rovers: [rover | control_center.rovers]}
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

end
