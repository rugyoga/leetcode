defmodule Solution do
  @spec three_sum(nums :: [integer]) :: [[integer]]
  def three_sum(nums) do
    three_sum_map(Enum.frequencies(nums))
  end

  def three_sum_map(map) do
    map
    |> Enum.flat_map(fn {x, n} -> two_sum(decrement(map, x), x) end)
    |> Enum.uniq()
    |> Enum.map(&Tuple.to_list/1)
  end

  def decrement(map, x), do: Map.update!(map, x, &(&1 - 1))

  def two_sum(map, sum) do
    Enum.flat_map(
        map,
        fn {x, n} ->
          if n > 0 and Map.get(decrement(map, x), -(sum+x), 0) > 0 do
            [sum, x, -(sum+x)] |> Enum.sort |> List.to_tuple() |> List.wrap()
          else
            []
          end
        end
    )
  end
end
