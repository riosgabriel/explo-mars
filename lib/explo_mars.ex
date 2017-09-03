defmodule ExploMars do

  def main(args) do
    {opts, _, _} = OptionParser.parse(args, switches: [file: :string], aliases: [f: :file])

    file_path = opts[:file]

    control_center = InputParser.parse_input(File.stream!(file_path))

    ControlCenter.display_current_location(control_center.rovers)
    ControlCenter.display_errors(control_center.errors)
  end
end
