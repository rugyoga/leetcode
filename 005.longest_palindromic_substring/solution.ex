defmodule Solution do
  @spec longest_palindrome(s :: String.t) :: String.t
  def longest_palindrome(s) do
    check({[],[]}, [], String.to_charlist(s))
    |> then(fn {p, seed} -> p ++ seed ++ Enum.reverse(p) end)
    |> List.to_string()
  end

  def check(best, _, []), do: best
  def check(best, past, [ch | future]) do
    [best, 
     palindrome(past, [ch | future], [], []),
     palindrome(past, future, [], [ch])]
    |> Enum.max_by(fn {p, seed} -> 2*length(p) + length(seed) end)
    |> check([ch | past], future)
  end

  def palindrome([x | xs], [y | ys], p, seed) when x == y, do: palindrome(xs, ys, [x | p], seed)
  def palindrome(_, _, p, seed), do: {p, seed} 
end
