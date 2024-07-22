defmodule Solution do
  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s) do
    check(String.split(s, "", trim: true), [])
  end

  def check([], []), do: true
  def check([], stack), do: false
  def check([op | ops], stack) when op in  ["{", "(", "["], do: check(ops, [op | stack])
  def check(["}" | ops], ["{" | stack]), do: check(ops, stack)
  def check([")" | ops], ["(" | stack]), do: check(ops, stack)
  def check(["]" | ops], ["[" | stack]), do: check(ops, stack)
  def check(ops, stack), do: false
end
