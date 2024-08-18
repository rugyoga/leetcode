defmodule Solution do
  @spec three_sum(nums :: [integer]) :: [[integer]]
  def three_sum(nums) do
    xs = nums |> Enum.sort() |> Enum.with_index()
    three_sum_list(xs, Enumm.reverse(xs))
  end

  def three_sum_list([], rev_list), do: []
  def three_sum_list([{x, _}| _], _) when x > 0, do: []
  def three_sum_list([{x, i}| xis], rev) do
    List.flatten(two_sum_list(x, i, xis, rev), three_sum_list(xis, rev))
  end

  def two_sum_list(_, _, [], _), do: []
  def two_sum_list(_, _, _, []), do: []
  def two_sum_list(x, i, [{y, y_i} | yis], [{z, z_i} | zis]) when y_i >= z_i, do: []
  def two_sum_list(x, i, [{y, y_i} | y_next] = yis, [{z, z_i} | z_next] = zis) do
    cond do
      x + y + z < 0 -> two_sum_list(x, i, y_next, zis)
      x + y + z > 0 -> two_sum_list(x, i, yis, z_next)
      true -> [{x, y, z} | two_sum_list(x, i, Enum.drop_while(y_next, &(&1 == y)), z_next)]
    end
  end
end
