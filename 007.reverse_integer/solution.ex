defmodule Solution do
  @max "2147483648"

  @spec reverse(x :: integer) :: integer
  def reverse(n) do
    neg = n < 0
    n
    |> abs()
    |> Integer.to_string()
    |> String.split("")
    |> Enum.drop_while(&(&1 == "0"))
    |> Enum.reverse()
    |> Enum.join("")
    |> then(fn s -> if(String.length(s) == 10 and if(neg, do: s > @max, else: s >= @max), do: "0", else: s) end)
    |> String.to_integer()
    |> then(fn x -> if(neg, do: -x, else: x) end)
  end
end
