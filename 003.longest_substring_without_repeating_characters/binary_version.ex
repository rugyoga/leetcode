defmodule Solution do
  defmodule Window do
    defstruct [:max, :seen, :sub_offset, :sub_size, :string]

    def new(s), do: %Window{max: 0, seen: MapSet.new, sub_offset: 0, sub_size: 0, string: s}

    def add_back(window, char) do
      %Window{window | seen: MapSet.put(window.seen, char), sub_size: window.sub_size+1, max: max(window.max, MapSet.size(window.seen)+1)}
    end

    def pop_front(window) do
      char = at(window.string, window.sub_offset)
      {char, %Window{ window | seen: MapSet.delete(window.seen, char), sub_offset: window.sub_offset+1, sub_size: window.sub_size-1}}
    end

    def next(window), do: window.sub_offset+window.sub_size

    def peek(window), do: at(window.string, next(window))

    defp at(string, offset) do
      <<_::binary-size(offset), byte::binary-size(1), _::binary>> = string
      byte
    end
  end

  @spec length_of_longest_substring(s :: String.t) :: integer
  def length_of_longest_substring(s) do
    compute(Window.new(s))
  end

  def compute(window) when window.sub_offset+window.sub_size == byte_size(window.string), do: window.max
  def compute(window) do
    char = Window.peek(window)
    if MapSet.member?(window.seen, char) do
      compute(drop_until(window, char))
    else
      compute(Window.add_back(window, char))
    end
  end

  def drop_until(window, item) do
    {char, window} = Window.pop_front(window)
    if(char == item, do: window, else: drop_until(window, item))
  end
end
