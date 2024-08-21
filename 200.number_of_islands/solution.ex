defmodule Solution do
  @spec num_islands(grid :: [[char]]) :: integer
  def num_islands(grid) do
    grid
    |> land()
    |> islands()
    |> Enum.count()
  end

  @land ?1
  def land(grid) do
    grid
    |> Enum.with_index()
    |> Enum.flat_map(
      fn {line, y} ->
        line
        |> Enum.with_index()
        |> Enum.flat_map(fn {t, x} -> if(t == @land, do: [{x,y}], else: []) end)
      end)
    |> MapSet.new()
  end

  def neighbours({x, y}), do: [{x, y-1}, {x, y+1}, {x-1, y}, {x+1, y}] |> Enum.filter(fn {x, y} -> x >= 0 and y >= 0 end)

  def island([], state), do: state
  def island([x | xs], {island, land}) do
    neighbours(x)
    |> Enum.filter(&MapSet.member?(land, &1))
    |> Enum.reduce(xs, fn x, xs -> [x | xs] end)
    |> island({[x | island], MapSet.delete(land, x)})
  end

  def islands(land) do
    if MapSet.size(land) == 0 do
      []
    else
      {island, land} = island([Enum.random(land)], {[], land})
      [island | islands(land)]
    end
  end
end  end
end
