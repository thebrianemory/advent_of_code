defmodule DayTwo do
  @input DayTwoInput.input()
  def solve_p1 do
    values =
      Enum.map(@input, fn str ->
        str
        |> String.graphemes()
        |> Enum.reduce(%{}, fn char, acc ->
          Map.update(acc, char, 1, &(&1 + 1))
        end)
        |> Map.values()
      end)

    Enum.map(values, fn arr ->
      cond do
        Enum.member?(arr, 2) && Enum.member?(arr, 3) -> [2, 3]
        Enum.member?(arr, 2) -> 2
        Enum.member?(arr, 3) -> 3
        true -> []
      end
    end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)
    |> Map.values()
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  def solve_p2 do
  end
end
