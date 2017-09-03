defmodule ExploMars do

  def main(args) do
    {opts, _, _} = OptionParser.parse(args, switches: [file: :string], aliases: [f: :file])

    file_path = case opts[:file] do
      nil -> "resources/mars.txt"
      path -> path
    end

    components = InputParser.parse_input(File.stream!(file_path))

    control_center = Enum.reduce(components, %ControlCenter{}, &ControlCenter.parse_component(&1, &2))

    ControlCenter.display_current_location(control_center.rovers)
  end
end
