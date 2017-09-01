defmodule ExploMars do

  def main(args) do
    {opts,_,_} = OptionParser.parse(args, switches: [file: :string], aliases: [f: :file])

    file_path = opts[:file]

    File.stream!(file_path)
    |> Enum.each(fn(x) -> convert_to_tuple(x) end)
  end

  def convert_to_tuple(input, separator \\ " ") do
    input
    |> String.strip
    |> String.split(separator)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end


end
