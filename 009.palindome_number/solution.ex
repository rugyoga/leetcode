defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    chars = "#{x}" |> String.to_charlist
    chars == Enum.reverse(chars)
  end
end
