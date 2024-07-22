defmodule Solution do
  @spec convert(s :: String.t, num_rows :: integer) :: String.t
  def convert(s, 1), do: s
  def convert(s, n) do
    s 
    |> String.to_charlist()
    |> Enum.chunk_every(2*n - 2)
    |> Enum.with_index()
    |> Enum.flat_map(
        fn {chunk, i} ->
            {down, zag} = Enum.split(chunk, n)
            base = (n-1) * i
            Enum.zip_with(down, 0..n-1, fn ch, row -> {{row, base}, ch} end) ++
            Enum.zip_with(zag, 1..n-2, fn ch, x -> {{n-x-1, base+x}, ch} end)
        end)
    |> Enum.sort()
    |> Enum.unzip()
    |> elem(1)
    |> List.to_string()
  end
end
