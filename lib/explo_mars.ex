defmodule ExploMars do

  def main(args) do
    {opts,_,_} = OptionParser.parse(args, switches: [file: :string], aliases: [f: :file])

    file_path = opts[:file]

    IO.inspect InputParser.parse_input(File.stream!(file_path))
  end
end
