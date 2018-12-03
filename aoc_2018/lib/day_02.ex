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
    find_it_slow()
  end

  def find_it_slow do
    # I couldn't figure this one out and borrowed the solution from
    # https://github.com/keathley/aoc_2018/blob/master/lib/day_two.ex
    # Out of all the ways I looked into it, never saw myers_difference used. But
    # then again I couldn't find any good way to do it. Learned something new at
    # least!
    Enum.find_value(@input, fn word ->
      Enum.find_value(@input, fn test_word ->
        case String.myers_difference(word, test_word) do
          [eq: first, del: d, ins: i, eq: last] ->
            if String.length(d) == 1 && String.length(i) == 1, do: {word, first <> last}

          [eq: first, del: d, ins: i] ->
            if String.length(d) == 1 && String.length(i) == 1, do: {word, first}

          [del: d, ins: i, eq: last] ->
            if String.length(d) == 1 && String.length(i) == 1, do: {word, last}

          _ ->
            false
        end
      end)
    end)
  end
end
