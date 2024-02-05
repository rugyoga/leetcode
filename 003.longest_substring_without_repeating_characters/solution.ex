defmodule Solution do
  defmodule Queue do
    defstruct [front: [], back: [], size: 0]

    def push(q, item), do: %Queue{ q | size: q.size+1, back: [item | q.back]}
    def pop(%Queue{size: 0} = q), do: {:empty, q}
    def pop(%Queue{front: [a | as]} = q), do: {a, %Queue{q | front: as, size: q.size-1}}
    def pop(%Queue{front: []} = q), do: pop(%Queue{q | front: Enum.reverse(q.back), back: []})
  end

  @spec length_of_longest_substring(s :: String.t) :: integer
  def length_of_longest_substring(s) do
    compute(String.to_charlist(s), {0, MapSet.new, %Queue{}})
  end

  def compute([], {n, _, _}), do: n
  def compute([a | as] = s, {_, seen, _} = window) do
    if MapSet.member?(seen, a) do
      compute(s, drop_until(window, a))
    else
      compute(as, add(window, a))
    end
  end

  def add({n, seen, q}, item) do
    {max(n, q.size+1), MapSet.put(seen, item), Queue.push(q, item)}
  end

  def drop({n, seen, q}) do
    {front, q} = Queue.pop(q)
    {front, {n, MapSet.delete(seen, front), q}}
  end

  def drop_until(window, item) do
    {front, window} = drop(window)
    if front == item do
      window
    else
      drop_until(window, item)
    end
  end
end
