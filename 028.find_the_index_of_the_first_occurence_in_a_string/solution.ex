defmodule Solution do
  @spec str_str(haystack :: String.t, needle :: String.t) :: integer
  def str_str(haystack, needle) do
    n = String.length(needle)
    haystack
    |> String.to_charlist()
    |> Enum.chunk_every(n, 1, :discard)
    |> Enum.map(&List.to_string/1)
    |> Enum.find_index(fn s -> s == needle end)
    |> then(&(&1 || -1))
  end
end
