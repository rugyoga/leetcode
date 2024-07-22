defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    ns = nums |> Enum.with_index() |> Enum.sort()
    find(ns, Enum.reverse(ns), target)
  end

  def find([{a, ai} | as] = al, [{b, bi} | bs] = bl, target) do
    cond do
    a + b == target -> [ai, bi]
    a + b > target -> find(al, bs, target)
    true -> find(as, bl, target)
    end
  end
end
