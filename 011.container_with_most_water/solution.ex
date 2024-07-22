defmodule Solution do
  @spec max_area(height :: [integer]) :: integer
  def max_area(height) do
    height = height |> Enum.with_index()
    best(height, height |> Enum.reverse(), 0)
  end

  def best([{hi, i} | front], [{hj, j} | back], volume) when i >= j, do: volume
  def best([{hi, i} | front] = a, [{hj, j} | back] = b, volume) do
    new_volume = (j-i) * min(hi, hj)
    if hi < hj do
       best(front, b, max(volume, new_volume))
    else
       best(a, back, max(volume, new_volume))
    end
  end
end
