defmodule Solution do
  def add_two_numbers(x, y, carry \\ 0)
  def add_two_numbers(nil, nil, 0), do: nil
  def add_two_numbers(x, y, carry) do
    {x_val, x_next} = if is_nil(x), do: {0, nil}, else: {x.val, x.next}
    {y_val, y_next} = if is_nil(y), do: {0, nil}, else: {y.val, y.next}
    sum = x_val + y_val + carry
    %ListNode{val: rem(sum, 10), next: add_two_numbers(x_next, y_next, div(sum,10))}
  end
end
