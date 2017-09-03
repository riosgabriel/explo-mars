defmodule InputParserTest do
  use ExUnit.Case

  test "convert '5 5' to list" do
    result = InputParser.convert_to_list("5 5")

    assert result == [5, 5]
  end

  test "convert '1 2 N' to list" do
    result = InputParser.convert_to_list("1 2 N")

    assert result == [1, 2, "N"]
  end

  test "convert 'LMLML' to list" do
    result = InputParser.convert_to_list("LMLML")

    assert result == ["LMLML"]
  end

end
