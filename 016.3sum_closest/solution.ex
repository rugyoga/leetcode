defmodule Solution do
  @spec three_sum_closest(nums :: [integer], target :: integer) :: integer
  def three_sum_closest(nums, target) do
    nums = nums |> Enum.with_index()
    []
    |> pairs(nums)
    |> Enum.sort(:desc)
    |> find(nums |> Enum.sort() |> Enum.map(fn {v, i} -> {v - target, i} end), nil)
    |> then(&(&1 + target))
  end

  def find([], _, best), do: best
  def find(_, [], best), do: best
  def find([{sum, ids} | sums] = a, [{num, id} | nums] = b, best) do
    cond do
    id in ids ->  if(sum + num > 0, do: find(sums, b, best), else: find(a, nums, best))
    sum + num == 0 -> 0
    sum + num > 0 -> find(sums, b, better(sum+num, best))
    true -> find(a, nums, better(sum+num, best))
    end
  end

  def pairs(accum, []), do: accum
  def pairs(accum, [_]), do: accum
  def pairs(accum, [{a, ai} | as]) do
    as
    |> Enum.reduce(accum, fn {b, bi}, accum -> [{a+b, [ai, bi]} | accum] end)
    |> pairs(as)
  end

  def better(new, nil), do: new
  def better(new, old), do: if(abs(new) < abs(old), do: new, else: old)
end
