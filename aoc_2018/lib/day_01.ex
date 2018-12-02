defmodule DayOne do
  def solve_p1 do
    Enum.sum(DayOneInput.input())
  end

  def solve_p2 do
    input = DayOneInput.input()

    solve(input, 0, [])
  end

  def solve(answer), do: answer

  def solve([], acc, results) do
    input = DayOneInput.input()

    solve(input, acc, results)
  end

  def solve([head | tail], acc, results) do
    acc = head + acc

    case Enum.member?(results, acc) do
      true ->
        solve(acc)

      false ->
        add_to_list_and_solve(tail, acc, results)
    end
  end

  def add_to_list_and_solve(tail, acc, results) do
    results = results ++ [acc]
    solve(tail, acc, results)
  end
end
