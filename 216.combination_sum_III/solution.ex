defmodule Solution do
  @spec combination_sum3(k :: integer, n :: integer) :: [[integer]]
  def combination_sum3(k, n) do
    combination_sum3_rec(k, n, [], 1, 9)
    |> List.flatten
    |> Enum.map(&elem(&1, 0))
  end

  def combination_sum3_rec(1, n, used, lo, hi), do: if(n in lo..hi, do: [{[n | used]}], else: [])
  def combination_sum3_rec(k, n, _, lo, _) when k*lo >= n, do: []
  def combination_sum3_rec(k, n, used, lo, hi), do:
    [combination_sum3_rec(k-1, n-lo, [lo | used], lo+1, hi),
     combination_sum3_rec(k, n, used, lo+1, hi)]
end
