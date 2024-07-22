defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t]) :: String.t
  def longest_common_prefix(strs) do
    next_prefix(String.to_charlist(hd(strs)), tl(strs))
  end

  def next_prefix(prefix, []), do: prefix |> List.to_string()
  def next_prefix([], _), do: ""
  def next_prefix(prefix, [a | as]) do
    prefix 
    |> Enum.zip(String.to_charlist(a))
    |> Enum.take_while(fn {x, y} -> x == y end)
    |> Enum.unzip() 
    |> elem(0)
    |> next_prefix(as)
  end
end
