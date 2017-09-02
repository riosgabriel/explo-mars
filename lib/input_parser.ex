defmodule InputParser do

  def parse_input(input) do
    components = input |> Enum.map(&convert_to_list/1)

    Enum.reduce(components, %ControlCenter{}, &ControlCenter.parse_component(&1, &2))
  end

  def convert_to_list(input, separator \\ " ") do
    input
    |> String.strip
    |> String.split(separator)
    |> Enum.map(&try_to_convert/1)
  end

  defp try_to_convert(s) do
    case Integer.parse(s) do
      { value , _} -> value
      :error -> s
    end
  end

end
